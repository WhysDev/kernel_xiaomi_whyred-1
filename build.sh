#!/bin/bash

export KERNELNAME=WhysTomcats

export LOCALVERSION=WhysTomcats-Rebase-oc-V1

export KBUILD_BUILD_USER=Whys

export KBUILD_BUILD_HOST=Tomcats

export TOOLCHAIN=clang

export DEVICES=whyred,tulip,lavender,a26x

export CI_ID=-1426728022

export GROUP_ID=-1001243147536

source helper

gen_toolchain

send_msg "⏳ Start building ${KERNELNAME} ${LOCALVERSION} | DEVICES: whyred"

send_pesan "⏳ Start building ${KERNELNAME} ${LOCALVERSION} | DEVICES: whyred"

START=$(date +"%s")

for i in ${DEVICES//,/ }
do
	build ${i} -oldcam

	build ${i} -newcam
done

send_msg "⏳ Start building Overclock version | DEVICES: whyred"

send_pesan "⏳ Start building Overclock version | DEVICES: whyred"

for i in ${DEVICES//,/ }
do
	if [ $i == "whyred" ]
	then
		build ${i} -oldcam -overclock

		build ${i} -newcam -overclock
	fi
done

END=$(date +"%s")

DIFF=$(( END - START ))

send_msg "✅ Build completed in $((DIFF / 60))m $((DIFF % 60))s, get nightly builds in @MoonlightCI | Linux version : $(make kernelversion) | Last commit: $(git log --pretty=format:'%s' -5)"

send_pesan "✅ Build completed in $((DIFF / 60)
