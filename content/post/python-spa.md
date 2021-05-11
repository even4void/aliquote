---
title: "Python and single-page application"
date: 2021-05-11T12:02:19+02:00
draft: false
tags: ["python"]
categories: ["2021"]
---

A few weeks ago I had to deploy a single web page to run custom software in the background and bring the user the results back. Without bothering you with the details, the idea was to provide the user with something like the MAFFT online server, but with only the bare essential: the app should only perform multiple alignment of a Fasta file, without reporting statistics or displaying results, and let the user download the aligned sequences as a Fasta file. Why an HTML form? Because the user might not want to use (or does not have access to) a terminal on the server. The same idea would equally applies for performing blast analysis and the like. That is, you have a working software on your server, and you want to serve it in a browser. This probably has been done a lot of time before, but as a lazy man I thought I could write a simple Flask application for that purpose.

Django would be overkill in this case, of course, yet Flask is a bit heavier than Perl+CGI.[^1] Anyway, here is how to write a single-page app in Flask+WSGI. Note that I use the term [single-page app](https://en.wikipedia.org/wiki/Single-page_application) (SPA) loosely here, because (1) it does not really fit in the landmark of SPAs and (2) there are in fact two pages. Flask is really great for building small to moderate sized website, and it comes with everything we need to manage file transfer in both directions (i.e., upload and download).

Let's say you have a file, `app.py`, which holds most of the code for the landing page. This file will be comprised of:

- the mandatory Python imports and configuration for Flask, e.g.:

    ```python
    from flask import Flask, abort, render_template, request, send_file
    from flask_bootstrap import Bootstrap
    from werkzeug.utils import secure_filename

    app = Flask(__name__)
    app.config["MAX_CONTENT_LENGTH"] = 1024 * 1024 * 10
    app.config["UPLOAD_EXTENSIONS"] = [".fasta"]
    app.config["UPLOAD_PATH"] = "/absolute-path-on-server/tmp/"

    bootstrap = Bootstrap(app)

    -%<--

    if __name__ == "__main__":
    app.run(host="localhost")
    ```

- the main page:

    ```python
    @app.route("/")
    def index():
        return render_template("upload.html")
    ```

- a way to deliver the results (as a file to download):

    ```python
    @app.route("/download")
    def download():
        outfile = os.path.dirname(os.path.abspath(__file__)) + "/out.fasta"
        return send_file(outfile, as_attachment=True)
    ```

I intentionally skip the uploading/downloading stuff since it depends on the web forms used (copy/paste in a `<textarea>` or file upload/download via a button). As an illustration, here is what I used to offer both options to the user regarding data input:

```html
<!-- defined in templates/upload.html -->>
<div class="form-group">
<form method="POST" action="" enctype="multipart/form-data">
	<label for="formSequence">Paste sequence or upload a file</label>
	<textarea id="formSequence" name="sequence" class="form-control" rows="20" wrap="off"></textarea>
	<p><input type="file" name="file"></p>
	<p><input type="submit" value="Submit"></p>
	<input type="reset" value="Clear">
</form>
</div>
```

Lastly, we can use `subprocess.call(cmd, shell=True)` to call our application, using `cmd` to store the complete call to the app with its options, which is exactly what we would type in a terminal. This will be handled in a separate function, with the same route as the index page but allowing for `POST` queries, i.e. `@app.route("/", methods=["POST"])`. Here's the skeleton I use:


```python
@app.route("/", methods=["POST"])
def upload_files():
    outfile = os.path.dirname(os.path.abspath(__file__)) + "/out.fasta"
    input_sequence = request.form["sequence"]           # (1) comes from the web form, templates/upload.html
    uploaded_file = request.files["file"]               # --- same here
    filename = secure_filename(uploaded_file.filename)  # (2) Not really needed if this is for personal use or trusted users
    if filename != "":
        file_ext = os.path.splitext(filename)[1]
        if file_ext not in app.config["UPLOAD_EXTENSIONS"]:
            abort(400)
        src = os.path.join(app.config["UPLOAD_PATH"], filename)
        uploaded_file.save(src)
        # (3) The following bizarre syntax is because we want to unwrap Fasta file; note that the
        # shell script unwrap.sh takes care of writing the output file at the right place.
        # A simpler call would be cmd = "mafft src > outfile"
        cmd = (
            "mafft "
            + src
            + "| "
            + os.path.dirname(os.path.abspath(__file__))
            + "/bin/unwrap.sh"
        )
        out = subprocess.call(cmd, shell=True)
        if out == 0:
            return render_template("result.html", text=fmt(outfile))
    return render_template("upload.html")
```

The `templates/result.html` page is just a read-only version of the `templates/upload.html` page, in my case:

```html
<!-- defined in templates/result.html -->>
<div class="form-group">
<textarea class="form-control rounded-0" rows="30" wrap="off">
{{ text }}
</textarea>
</div>

<p><a href="{{ url_for('.download') }}">Download</a></p>
```

And that's it!

For production, it is recommended to use another proxy, like [waitress](https://pypi.org/project/waitress/), and replace `app.run(host="localhost")` with something like this:

```python
from waitress import serve
serve(app, host="0.0.0.0", port=5000)
```


[^1]: I once built a simple CGI script to launch Stata on a remote (personal) server and collect result in plain old text files. That was quite funny, but deploying this kind of stuff over secured networks is a pain.
