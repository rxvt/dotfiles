function til --description "Create a new TIL entry and open with LazyVim til snippet"
    # Check if we have the required argument
    if test (count $argv) -eq 0
        echo "Usage: til <topic-name>"
        echo "Examples:"
        echo "  til vim-new-command"
        echo "  til git/rebase-interactive"
        echo "  til javascript/array-methods"
        return 1
    end

    # Set the TIL directory
    set til_dir ~/src/til

    # Check if TIL directory exists
    if not test -d $til_dir
        echo "Error: TIL directory $til_dir does not exist"
        return 1
    end

    # Get the topic name and handle directory structure
    set input_path $argv[1]

    # Check if there's a directory separator
    if string match -q "*/*" $input_path
        # Split path and filename
        set dir_parts (string split "/" $input_path)
        set filename $dir_parts[-1] # Last part is the filename
        set dir_path (string join "/" $dir_parts[1..-2]) # Everything before the last part

        # Sanitize directory path and filename
        set dir_path (echo $dir_path | tr ' ' '-' | string lower)
        set filename (echo $filename | tr ' ' '-' | string lower)

        # Create the full directory path
        set full_dir_path "$til_dir/$dir_path"

        # Create directory if it doesn't exist
        if not test -d $full_dir_path
            echo "Creating directory: $full_dir_path"
            mkdir -p $full_dir_path
        end

        # Set the full file path
        set filepath "$full_dir_path/$filename"
    else
        # No directory separator, just a filename
        set filename (echo $input_path | tr ' ' '-' | string lower)
        set filepath "$til_dir/$filename"
    end

    # Add .md extension if not present
    if not string match -q "*.md" $filepath
        set filepath "$filepath.md"
    end

    # Check if file already exists
    if test -f $filepath
        echo "File $filepath already exists. Opening existing file..."
        set original_dir (pwd)
        cd $til_dir
        nvim $filepath
        cd $original_dir
        return 0
    end

    echo "Creating new TIL: $filepath"

    # Store current directory to return to later
    set original_dir (pwd)

    # Change to TIL directory
    cd $til_dir

    # Create file with "til" pre-typed for snippet expansion
    echo '# ' >$filepath

    # Open Neovim and automatically trigger snippet expansion
    # This attempts to auto-expand the snippet on opening
    nvim +"lua vim.defer_fn(function() vim.api.nvim_feedkeys('A', 'n', true) end, 50)" $filepath

    # Return to original directory
    cd $original_dir
end
