[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/79eoHK-K)
# General Assignment Directions
The following instructions are a condensed version of the instructions from your first assignment.  If you are unsure what to do for a particular step, refer back to the instructions for your first assignment.  

The instructions for future paper-like assignments will be condensed further. 

## To Get Started
  1. Accept this assignment.
  1. Obtain the URL for your repository.
  1. Clone this repository to your computer.  
     ```
     cd ~/classes/comp122/deliverables
     ls
     git clone git@github.com:COMP122/03-mathematical-review-smf-steve.git
     ```
     Note that you need to replace the substring "smf-steve" with your Github account name.

  1. Change to the working directory for this assignment, and review the "assignment.md" file.
     ```
     cd 03-mathematical-review-smf-steve
     cat assignment.md
     ```
     Note that you need to replace the substring "smf-steve" with your Github account name.

  1. Make a copy of this file, naming it "submission.md": 
     ```
     cp assignment.md submission.md
     ```
  1. Edit the "submission.md" file to include your name, etc.: `subl submission.md`
  1. Add this file to your local repository: `git add submission.md`
  1. Commit this file to your local repository: `git commit -m 'creating file'`
  1. Push the current contents of your local repository to remote repository: `git push`


## Work on the Assignment
  1. Incrementally edit and submit your "submission.md" file
     - `subl`, `git add`, `git commit`, and `git push`
     - get into the habit of making incremental updates to your working assignments.
  1. Provide an response to all items that are meant to be provided.
     - an HTML comment tags `<!-- response -->` have been added to each line that requires a response.
     - your response should be placed to the left of the HTML comment.
  1. Use additional spacing to ensure your answer is _easy_ to read to maximize credit.
  1. Add additional information as you feel is necessary to maximize credit.
  1. Review what the rendering of the "submission.md" looks like with a Markdown viewer, e.g., One Markdown.
     - re-edit the file to make any necessary changes, before your final "push."
  1. Submit your final version of the deliverable, which is the contents of the entire local repository
     ```
     git push
     ```

## Grading
  1. A semi-automated process will be used to expedite the grading of this assignment. 
  1. As such, it is important that you position your answers appropriately within the "submission.md" file.
  1. As part of the grading process, the Professor may add two files your repository:
     1. "answers.md": which provides the Professor's solution to the assignment.
     1. "grade.report": which provides your final score and associated breakdown.
  1. The professor will announce via slack when a particular assignment has been graded.


