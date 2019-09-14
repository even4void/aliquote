+++
title = "Around survey methodology and questionnaire design"
date = 2008-03-24T21:24:09+01:00
draft = false
tags = ["readings"]
categories = ["2008"]
+++

Recently, I read some books related to survey design and the way a questionnaire should be constructed so as to maximize the information we want to gain from it. Among others, I found Willis's book, *Cognitive Interviewing, A Tool for Improving Questionnaire Design*, 2005, well structured, though some topics are developed far from what I would qualify as a really concise overview. Other lectures included more statistical techniques oriented toward survey design and implementation. This includes a concise (but very dense!) book written by E. S. Lee and R. N. Forthofer, *Analyzing Complex Survey Data* (2006, Sage Publications).

Also, I've reviewed various articles related to survey methodology for large-scale educational assessments (see references (5) and ff.). Apart from focusing on the precision of the related estimators, an interesting issue arises when one wants to design effective sampling using a computer. Indeed, when conducting a survey, we have to sample the units without replacement, which is quite different from the usual asymptotic approach in behavioral studies where we mainly use random sampling with replacement (hence, assuming an infinite population).

Before presenting some of the main issues discussed in Willis's book, the interested reader may refer to the [National Cancer Institute][National Cancer Institute] where some tutorials on Item Response Theory and Questionnaire Design are proposed. In fact, there is a short PDF article of Gordon Willis, [Cognitive Interviewing, A "How to" Guide][Cognitive Interviewing, A "How to" Guide]. I also found these PDF [guidelines][guidelines] on the Cooperative State Research, Education, and Extension Service. It's not too surprising to find such material since cognitive interviewing has been mainly developed in the context of medical or psychological assessment. Other references are given at the end of this post<sup>(1,2)</sup>. For a general overview of survey methodology, please refer to (13).

Hereafter, I propose a quick summary of Willis's book to help the reader understand what sits behind this sound wording. First, the book is intended to all questionnaire designers who are interested in how cognitive strategies might affect verbal or web responses.

The following book might also be of potential interest for the questionnaire/survey designer: *Designing and Conducting Health Surveys: A Comprehensive Guide*, by Aday and Cornelius (2006). The TOC can be visualized here in PDF, and there is an online chapter excerpt (Chapter 1, in PDF) on Jossey-Bass website: [Thinking about topics for health surveys][Thinking about topics for health surveys].

Further, here is a general annotated bibliography on survey methodology (aims, methods, caveats, etc.), available as [BibTeX file][BibTeX file] or [HTML page][HTML page].

There are several ways to implement on-line questionnaire. Indeed, various technologies have now become deployed over the internet, including usual html/PHP web form (static or dynamic), Perl CGI, Macromedia Flash, or even Java for mobile device. I will propose soon some kind of demonstrations of each of these tools one day...

### References

1. Hughes, K.A. (2004). <a href="http://www.census.gov/srd/papers/pdf/rsm2004-02.pdf">Comparing pretesting methods: Cognitive interviews, respondent debriefing, and behavior coding</a>. Report of Statistical Research Division, Survey Methodology #2004-02.

2. Waddington, P.A.J. and Bull, R. (2007). <a href="http://sru.soc.surrey.ac.uk/SRU50.pdf">Cognitive interview as a research technique</a>. *Social Research Update*, vol. 50.

3. Ackermann, A.C. and Blair, J. (2006). <a href="http://www.abtassociates.com/presentations/AAPOR06_Efficient_Respondent_Selection.pdf">Efficient respondent selection for cognitive interviewing</a>. *American Association for Public Opinion Research Conference*.

4. Conrad, F., Blair, J., and Tracy, E. (1999). <a href="http://www.fcsm.gov/99papers/conrad1.pdf">Verbal reports are data! A theoretical approach to cognitive interviews</a>. *Federal Committee on Statistical Methodology Conference*. (All proceedings are available to download)

5. Wilson, M. and Adams, R. (1995). <a href="http://www.amstat.org/Sections/Srms/Proceedings/papers/1995_043.pdf">Issues in complex sampling latent variables</a>. *Proceedings of the Survey Research Methods Section of the American Statistical Association*. (All proceedings from 1978 to 2007 are available to download)

6. Heuer, R., Doherty, J., and Zwieg, E. (2007). <a href="http://www.rti.org/pubs/aapor07_heuer_paper.pdf">Interview timing data: Simple yet powerful survey instrument development tools</a>. *Proceedings of the 62nd Annual Conference of the American Association for Public Opinion Research (AAPOR)*. 

7. Blair, J. and Presser, S. (1993). <a href="http://www.amstat.org/sections/srms/Proceedings/papers/1993_059.pdf">Survey procedures for conducting cognitive interviews to pretest questionnaires: A review of theory and practice</a>. *Proceedings of the Survey Research Methods Section of the American Statistical Association*. (See Note above)

8. Petroni, R., Sigman, R., Willimack, D., Cohen, S., and Tucker, C. (2004). <a href="http://www.bls.gov/bls/fesacp2061104.pdf">Response rates and nonresponse in Establishment surveys — BLS and Census Bureau</a>. *Presentation to the Federal Economic Statistics Advisory Committee*.

9. Morrisson, R.L., Anderson, A.E., and Brady, C.F. (2005). <a href="http://www.amstat.org/Sections/Srms/Proceedings/y2005/Files/JSM2005-000130.pdf">The effect of data collection software on the cognitive survey response process</a>. *Proceedings of the Survey Research Methods Section of the American Statistical Association*. (See Note above)

10. Nichols, E. and Childs, J.H. (2007). <a href="http://www.census.gov/srd/papers/pdf/rsm2007-39.pdf">Respondent debriefings conducted by experts: A new qualitative methodology for questionnaire evaluation</a>. Report of Statistical Research Division, Survey Methodology #2007-39.

11. Clark, H.H. and Shaeffer, E.F. (1989). <a href="http://www-psych.stanford.edu/~herb/1980s/Clark.Schaefer.89.pdf">Contributing to discourse</a>. *Cognitive Science*, **13**, 259-294.

12. Dillman, D.A. and Bowker, D.K. (2001). <a href="http://www.sesrc.wsu.edu/dillman/zuma_paper_dillman_bowker.pdf">The Web questionnaire challenge to survey methodologists</a>. In *Dimensions of Internet Science*, U.-D. Reips &amp; M. Bosnjak (Eds.). Pabst Science Publishers.

13. Groves, R.M., Fowler, F.J., Couper, M.P., Lepkwoski, J.M., Singer, E., and Tourangeau, R. (2004). *Survey Methodology*. John Wiley &amp; Sons.

14. Schaeffer, N.C. and Presser, S. (2003). <a href="http://www.scribd.com/doc/259321/The-Science-of-Asking-Questions?page=20">The science of asking questions</a>. *Annual Review of Sociology*, **29**, 65-88.

[National Cancer Institute]: http://appliedresearch.cancer.gov/areas/cognitive/
[Cognitive Interviewing, A "How to" Guide]: http://appliedresearch.cancer.gov/areas/cognitive/interview.pdf
[guidelines]: http://www.csrees.usda.gov/nea/food/pdfs/cog_interview.pdf
[Thinking about topics for health surveys]: http://media.wiley.com/product_data/excerpt/05/07879756/0787975605.pdf
[BibTeX file]: http://www.aliquote.org/pub/surveys.bib
[HTML page]: http://www.aliquote.org/pub/surveys.html