# if there is no commit:
    # "shrug-status: error: your repository does not have any commits yet" 
# else:
# if file in curr_dir is diff from file in last_commit:
    # if file in curr_dir is diff from file in index:
        # if file in index is diff from file in last_commit:
            # echo "$file - file changed, different changes staged for commit"
        # else:
            
    # else:
        # echo "$file - file changed, changes not staged for commit"
    
