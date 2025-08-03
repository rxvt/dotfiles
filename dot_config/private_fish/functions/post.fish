function post --description "Create a new post entry and open with LazyVim post snippet"
    # Check if we have the required argument
    if test (count $argv) -eq 0
        echo "Usage: post <topic-name>"
        echo "Examples:"
        echo "  post vim-new-command"
        echo "  post javascript-array-methods"
        return 1
    end

    # Set the post directory
    set post_dir ~/src/shaneanderson.id.au/content

    # Check if post directory exists
    if not test -d $post_dir
        echo "Error: post directory $post_dir does not exist"
        return 1
    end

    # Get the topic name and sanitize it
    set filename (echo $argv[1] | tr ' ' '-' | string lower)

    # Set the file path
    set filepath "$post_dir/$filename"

    # Add .md extension if not present
    if not string match -q "*.md" $filepath
        set filepath "$filepath.md"
    end

    # Check if file already exists
    if test -f $filepath
        echo "File $filepath already exists. Opening existing file..."
        set original_dir (pwd)
        cd $post_dir
        nvim $filepath
        cd $original_dir
        return 0
    end

    echo "Creating new post: $filepath"

    # Store current directory to return to later
    set original_dir (pwd)

    # Change to post directory
    cd $post_dir

    # Create file with "post" pre-typed for snippet expansion
    # echo post >$filepath

    # Open Neovim and automatically trigger snippet expansion
    # This attempts to auto-expand the snippet on opening
    # nvim +"lua vim.defer_fn(function() vim.api.nvim_feedkeys('A', 'n', true) end, 50)" $filepath
    nvim $filepath

    # Return to original directory
    cd $original_dir
end
