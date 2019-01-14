import glob, os, shutil

def files_to_folders():
     #set location to organize files into folders to the current director
     folder = os.getcwd()
     print("Location of files to put into folders:" + x)

     #for each file in the current directory
     for file_path in glob.glob(os.path.join(folder, '*.*')):
         #split the filepath on the 3rd hyphen
         new_dir = file_path.rsplit('_', 3)[0]
         #print the new name of the filepath
         print(new_dir)
         #if the folder for that file already exists, move this file to the existing location
         if os.path.isdir(os.path.join(folder, new_dir)):
              shutil.move(file_path, os.path.join(new_dir, os.path.basename(file_path)))
         #if the folder for that file does not exist, create the folder and move the file into it
         else:
              os.mkdir(os.path.join(folder, new_dir))
              shutil.move(file_path, os.path.join(new_dir, os.path.basename(file_path)))

#run function 
files_to_folders()
