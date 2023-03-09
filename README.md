To make cmd + click open the file link in nvim:

cmd + space to search for automator

choose application

in the search bar look for Run AppleScript and drag it to the right.
where it says:

Drag actions or files here:

and replace the default code with:

```ruby
on run {input, parameters}
  set cmd to "nvim"
  if input is not {} then
    set filePath to POSIX path of input
    set cmd to "nvim \"" & filePath & "\""
  end if
    
  tell application "iTerm"
    create window with default profile
    tell the current window
      tell the current session to write text cmd
    end tell
  end tell
end run
```

save the file as application

now go and open a ruby file or any other file_type and right click the file
select 'Get info' and select open with other. and look for the recently created file.

dont forget to click on the button 'Change All...' underneat the open with.
