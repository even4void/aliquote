+++
title = "Back to a Time Capsule"
date = 2012-06-16T16:37:53+01:00
draft = false
tags = ["apple"]
categories = ["2012"]
+++

The hard drive I used to backup my Macbook everyday day or so has crashed. Back to a Time Capsule and the joy of the first synchronization.

Here are some background information for the record: I owned a Time Capsule (TC) three years ago, which crashed after 6 months of use. I switched to an external HD with firewire on my old Macbook Pro and I was pretty happy with that since daily backup didn't take a long time. When I got the new [Airbook]({{< ref "/post/welcome-to-the-macbook-air.md" >}}) which lacks Firewire connecticity, I relied on simple USB backup on a 500 Go external HD. Backup time was in the "acceptable range". Im' back to a TC now.

The Time Capsule is really easy to configure, especially when we just want it to be connected to our network as a simple client. This is entirely done with Airport utility. Then, we just have to change Time Machine setting to tell it to use the TC HD for backups, and then... well, we just have to wait for a long, very long time. How long do you say?

![Waiting](/img/20120615230808.png)

Who said we live in a wireless land? The above time is for the case where we are using wireless access to the TC, with the TC configured as a client to my home wireless network. We can get more reasonnable timing by creating a network for the Time Capsule (which is the default option) and connecting the Macbook and the TC directly with an ethernet cable, as documented on Apple's KB: [Backing up with Time Capsule for the first time](http://support.apple.com/kb/HT1175). Of course, you will need an ethernet adapter for your Macbook :-) This way, I got something like 90 Go saved in 3,5 hours.

I know we can connect external HDs or printer to the TC. What about connecting the Air's SuperDrive? This simply doesn't work. That is so generous of you Apple...

Next step: Accessing the TC when I am out of my home network.
