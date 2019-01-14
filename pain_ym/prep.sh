#unzip the orignal pain data compressed file
unzip pain_raw.zip

#rename extracted folder to pain_raw and make scan1 and scan2 folders
mv PainTask/ pain_raw
mkdir -p scan1 scan2

#move to extracted data folder
cd pain_raw


#remove any duplicate files, all of which include a parenthesis, move scan 1/2 files to respective directories
rm *\(*
cp *_1_* ../scan1
cp *_2_* ../scan2

#create folders for the 4 conditions if they don't already exist in each scans superfolder
cd ../scan1/
mkdir -p paincue nopaincue painshock nopainshock
mv *[^No]PainShock* painshock/
mv *NoPainShock* nopainshock/
mv *[^No]Paincue* paincue/
mv *NoPaincue* nopaincue/

cd ../scan2/
mkdir -p paincue nopaincue painshock nopainshock
mv *[^No]PainShock* painshock/
mv *NoPainShock* nopainshock/
mv *[^No]Paincue* paincue/
mv *NoPaincue* nopaincue/

#unzip image files in each subfolder and make folder to hold averages
cd painshock
gunzip *
mkdir -p averages

cd ../nopainshock
gunzip *
mkdir -p averages

cd ../paincue
gunzip *
mkdir -p averages

cd ../nopaincue
gunzip *
mkdir -p averages


#for the scan1 folder as well
cd ../../painshock
gunzip *
mkdir -p averages

cd ../nopainshock
gunzip *
mkdir -p averages

cd ../paincue
gunzip *
mkdir -p averages

cd ../nopaincue
gunzip *
mkdir -p averages

