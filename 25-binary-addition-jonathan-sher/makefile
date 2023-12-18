# Makefile to process a Markdownn (MD) submission
#   Simply validates the minimal requirements before grading can occur
TAG=<!--
SUBMISSION=submission.md

## On the Mac the # in the next two turn out to be comments
NAME=$(shell awk '/Name:/ {print $$3}' $(SUBMISSION) )
ACCOUNT=$(shell awk '/GitHub Account:/ {print $$4}' $(SUBMISSION) )
COMMITS=$(shell git log --oneline | wc -l)
MIN_COMMITS=6

SHELL=/bin/bash

# Make targets explained
# all: 
#   - the default target used by students to check their submission
#
# validate_submission: 
#   - used by the github to run a validation check of a student submission
#
# grade: 
#   - the target used by the prof to support auto-grading

all: validate_submission response_key

validate_submission: validate_submission_file validate_name validate_account number_commits 

# md_submmission is the make target of github
response_key:  # 
	@echo ---------------------------------
	@echo Press \"RETURN\" to review your responses:
	@echo 
	@read
	@create_response_key < $(SUBMISSION)	
	
validate_submission_file:
	@test -f $(SUBMISSION) || \
	  { echo \"$(SUBMISSION)\" is missing && false ; }

# Currently the Name and Account line has a response TAG on it.
validate_name:
	@test -n "$(NAME)" -a "$(NAME)" != "$(TAG)"

validate_account:
	@test -n "$(ACCOUNT)" -a "$(ACCOUNT)" != "$(TAG)"


# The number of commits on the server is always 1. 
# Hence we can't test for the number of commits, so ensure no make error is reported
number_commits:
	@if [ 1 -lt "$(COMMITS)" -a $(COMMITS) -lt $(MIN_COMMITS) ] ; then  \
	  echo "Less than $(MIN_COMMITS) commits" ; false ; fi


grade: validate_submission 
	#@open $(SUBMISSION)
	#@subl $(SUBMISSION)
	@create_response_key < $(SUBMISSION) > response_key.md
	@subl response_key.md


