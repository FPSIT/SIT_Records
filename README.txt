# We use UNIX-style line endings.
# Plaintext files should not have more than 100 characters per line
# Use four-space soft tabs for consistent readability across different systems

# The organization of this git repository is primarily the responsibility of the club secretary
# Anyone adding or modifying files in this folder has the responsibility to put files where 
# they belong

# The notation <element> implies that <element> should be replaced with its variable value
# e.g. attendance_meeting_<index>.csv becomes attendance_meeting_0.csv ... attendance_meeting_1.csv

---------------------------------------------------------------------------------------------------

BEST PRACTICES

Files in this git repository should be organized into their related folder
The creation of new folders should respect content defined in the DIRECTORY STRUCTURE section.
New folders should not have ambiguous names and should not be more than three or four levels deep 
from the top level directory.

Files will not have whitespace characters in their names. 
With the exception of the README, files should be named in all_lowercase, with no whitespace
characters included in filenames. 
e.g. peer_learning.txt
This circumvents the need to use escape sequences in nongraphical interactions

---------------------------------------------------------------------------------------------------

DIRECTORY STRUCTURE

/general
The "general" folder is used for otherwise top-level files like "member list" or "constitution"
    the purpose of the general folder is to keep the top-level directory clean

/meetings
The meetings folder has two subdirectories. Files should not be placed directly into /meetings/*
    /meetings/attendance/
        # exclusively contains attendance sheets for every meeting
        # naming convention: attendance_meeting_<index>.csv

    /meetings/content/
        # contains lecture slides as well as new meeting content or ideas
        # lecture slides should follow the naming convention meeting_<index>.pptx

