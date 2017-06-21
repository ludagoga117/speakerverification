#!/bin/bash
filename="/home/david/kaldi/egs/speakerverification_masterdegre/userid.txt"
dropboxfolder="/home/david/Dropbox/Maestria/PatternRecognition/audiocapturewep/media/speechcapture/speech/"
audiotestfolder="/home/david/kaldi/egs/speakerverification_masterdegre/utterances_audio/test/"
audiotrainfolder="/home/david/kaldi/egs/speakerverification_masterdegre/utterances_audio/train/"
prefixfiledropbox="user"

cat $filename | while read LINE # Me traigo línea por línea del archivo userid.txt
do
	userid=${LINE%%	*} # De cada línea saco la primera columna (elimino desde el TAB)
	cerosfaltantes=$((5-${#userid})) # Cuento cuantos dígitos tiene y calculo los 0s faltantes

	useridfinal="user" # El ID del usuario arranca con user
	for i in `seq 1 $cerosfaltantes`;
	do
		useridfinal+="0" # Concateno tantos ceros como sean necesarios
	done
	useridfinal+=$userid # Al final le pego el ID del usuario

	#echo $useridfinal
	
	mkdir $audiotestfolder$useridfinal
	chmod 755 $audiotestfolder$useridfinal
	
	#echo $dropboxfolder$useridfinal"_*"
	cp "$dropboxfolder$useridfinal"* $audiotestfolder$useridfinal"/"
	
	

done
