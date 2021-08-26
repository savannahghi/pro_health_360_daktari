# Review Checklist

[![Bugs](https://img.shields.io/badge/BugFixes-0-red.svg?style=for-the-badge)](https://shields.io/)
[![Features](https://img.shields.io/badge/Features-0-orange?style=for-the-badge)](https://shields.io/)
[![Tests](https://img.shields.io/badge/Tests-0-success.svg?style=for-the-badge)](https://shields.io/)

#### Summary*

- [ ] fix: Bug fix for `Add the items tackled here as checklists`
- [x] feat: Completed task
- [ ] chore: Incomplete task
  - [ ] test: Sub-task 1


#### Structure*

- [ ] The MR has a `proper` title that conforms to our [MR title standards](https://gitlab.slade360emr.com/optimalhealth/bewell-professional#message-header)
- [ ] The MR has one commit, and if there are more than one, they should be squashed
- [ ] The commit should have a proper title and a short description
- [ ] The commit must be signed off
- [ ] Unused imports are not present
- [ ] Dead code is not present
- [ ] Ensure dry running app to confirm changes

#### Tests

- [ ] Proper and high quality unit and widget tests have been written
- [ ] The coverage threshold should not be lowered (confirm if the [coverage file](../../check_coverage.py) has been modified)
- [ ] The coverage threshold should be increased by at least 0.2%

#### Responsiveness

- [ ] Mobile (Small screen) Screenshots are included
- [ ] Tablet (Large screen) Screenshots are included

### Sign off*

- [ ] All comments have been resolved by the reviewers
- [ ] Approved by Czar {replace_with_czar_name}
- [ ] Signed off by second reviewer {replace_with_name}
- [ ] Ensure all checks are done before merging :warning:

#### N/B:

- Add a checklist if more than one item is done.
- Add screenshots and/or images where necessary
- Indicate any breakages caused in the UI :exclamation:
- Where necessary, indicate which issue the MR solves (Closes #)
- Any new files are updated in the folder structure in the [readME](../../README.md)
