# Makefile to process a Markdownn (MD) submission
#   Simply validates the minimal requirements before grading can occur

# The TAG represents the HTML comment that identifies a line that contains a response
TAG=<!-- response
ANSWER=\([\t ]*.*\)

SUBMISSION=submission.md

## On the Mac the # in the next two turn out to be comments
NAME=$(shell awk '/Name:/ {print $$3}' $(SUBMISSION) )
ACCOUNT=$(shell awk '/GitHub Account:/ {print $$4}' $(SUBMISSION) )
COMMITS=$(shell git log --oneline | wc -l)
MIN_COMMITS=4


all: 
	java_subroutine volume_cube 3
	mips_subroutine volume_cube 3
	java_subroutine surface_area_box 3 3 3
	mips_subroutine surface_area_box 3 3 3
	java_subroutine future_value 100000 3 1
	mips_subroutine future_value 100000 3 1

validate: number_commits
	-make -k  > validation.output 2>&1
	git add validation.output
	git commit -m 'Auto adding validation step' validation.output


# Currently, the number of commits does not work on the server side
# the log file only shows the most recent entry -- 
# not sure why or what the work around is.
number_commits:
	@test ! $(COMMITS) -lt $(MIN_COMMITS) || \
	  { echo "Not enough commits" && false ; } 

