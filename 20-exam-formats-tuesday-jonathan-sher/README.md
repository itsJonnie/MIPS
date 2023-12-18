## General Assignment Directions
These are the general directions to all assignments that require the student to submit a document.  Such documents shall be in the MD (markdown) format, and MUST be named "submission.md".

## To Get Started
  1. Accept this assignment via the link provided by the Professor

  2. Clone this repository to your computer within the deliverables subdirectory. 
     `git clone {git-url}`

  3. Review the "assignment.md" file.

  4. Make a copy of this file, naming it "submission.md": 
     `cp assignment.md submission.md`

  5. Edit this file 
     * to include your name in the appropriate location
     * to include your github account in the appropriate location

  6. Add this file to your local repository: 
     `git add submission.md`

  7. Commit this file to your local repository: 
     `git commit -m 'creating file'`

  8. Run the make command to test if your work so far: 
     `make`

  9. Push the current contents of your local repository to remote repository: 
     `git push`

  10. Validate that you have successfully submitted your first version.
      `git repo-state`

## Work on the Assignment
  1. Incrementally edit and submit your "submission.md" file
     - `git add`, `git commit`, and `git push`
     - This incremental approach is part of the software development process.

  2. Place your answers in the proper location.

     > The Professor uses a semi-automated process to facilitated grading.  From 
     > your "submission.md" file, a "response key" is generated.  The Professor 
     > compares the "answer key" to this "response key".
     >
     > Response tags have been included in the assignment.md file to indicate where
     > you are expected to provide a response.

     - There are two types of response tags
       1. A HTML comment (`<!-- response -->`) 
          - Your response *must* be placed to the left of the HTML comment.

       1. Code blocks  (```response)
          - Your response *must* be placed within the code block 

     - You may add additional response tags.

  3. Some questions might provide either to many or to few response lines.
     - You may add additional response lines (which must include the response tag.
     - You *must* remove the response lines you don't need.

  4. Use additional spacing to ensure your answer is _easy_ to read to maximize credit.

  5. Add additional information as you feel is necessary to maximize credit.


## Perform a final review of your submission
  1. Review your file using a Markdown Editor: (open/start submission.md)
  2. Review your file using the Sublime Editor:  (subl submission.md)
  3. The contents of your file must be presented professionally.
  4. Make any formatting updates to your submission.md file
  5. Run `make` command to validate your submission and to view your final response key.
  7. Perform a final `git push` to make your final submission.
  8. Prepare a pull request to summarize your work and to validate you have successfully submitted your work: `git pull-request`

## Grading
   1. A semi-automated process will be used to expedite the grading of this assignment. 
   2. As such, it is important that you position your answers properly.
   3. As part of the grading process, the Professor may add two files to your repository:
      1. "answers.md": which provides the Professor's solution to the assignment.
      1. "grade.report": which provides your final score and associated breakdown.
   4. The professor will announce via slack when a particular assignment has been graded.

## Requirements for Grading
  1. The original assignment.md file must not have been changed.
  1. The ONLY file the Professor will grade is "submission.md".
  1. Both your name and github account must be included in your submission.
  1. You must have a minimum of the defined number of commits.



