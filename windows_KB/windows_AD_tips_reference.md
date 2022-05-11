# AD tricks and references

**Source:** https://stackoverflow.com/questions/26977379/powershell-count-members-of-a-ad-group

### Using Powershell to get the user count in the member group in AD

`$users = @(Get-ADGroupMember -Identity 'Group Name')`

`$users.count`
