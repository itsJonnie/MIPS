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

  8. Run the make command to test if you work so far: 
     `make`

  9. Push the current contents of your local repository to remote repository: 
     `git push`

  10. Validate that you have succefully submitted your first version.
      `git repo-state`

## Work on the Assignment
  1. Incrementally edit and submit your "submission.md" file
     - `git add`, `git commit`, and `git push`
     - This incremental approach is part of the software development process.

  2. Provide a response to all items that are marked with a response tag (`<!-- response -->`)
     - These response tags are just HTML comments that will not render in the final document.

     - Your response *must* be placed to the left of the HTML comment.

     - You may add additional response tags, and you *must* remove the response tags you don't need.

  3. Use additional spacing to ensure your answer is _easy_ to read to maximize credit.

  4. Add additional information as you feel is necessary to maximize credit.


## Perform a final review of your submistion
  1. Review your file using a Markdown Editor: (open/start submission.md)
  2. Review your file using the Sublime Editor:  (subl submission.md)
  3. The contents of your file must be presented professionally.
  4. Make any formating updates to your submission.md file
  5. Run the make command to validate things are working correctly: `make`
  7. Perform a final `git push` to make your final submission.
  8. Prepare a pull request to summarize your work and to validate you have succussfull submitted your work: `git pull-request`

## Grading
   1. A semi-automated process will be used to expedite the grading of this assignment. 
   2. As such, it is important that you position your answers appropriately within the file called "submission.md"
   3. As part of the grading process, the Professor may add two files to your repository:
      1. "answers.md": which provides the Professor's solution to the assignment.
      1. "grade.report": which provides your final score and associated breakdown.
   4. The professor will announce via slack when a particular assignment has been graded.

## Requirments for Grading
  1. The original assignment.md file must not have been changed.
  1. The ONLY file the Professor will grade is "submission.md".
  1. Both your name and github account must be included, in the appropriate location, within the submission.md file.
  1. You must have a minimum of the defined number of commits.



