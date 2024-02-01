user=$( whoami )
directory_path="/home/${user}/dotfiles/preset-scripts"
if [ -d "$directory_path" ]; then
    files_array=("$directory_path"/*)
    for file_path in "${files_array[@]}"; do
      # add this to path
        echo "$file_path"
    done
else
    echo "Error getting preset scripts directory, make sure you cloned this repo at your home directory"
fi

