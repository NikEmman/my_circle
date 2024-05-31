# Follow requests
* Make new table FollowRequests, columns user_id(follower issuing request), user_id(as followee to accept/reject req), a status column with (:pending, :accepted, :rejected). Sending a requests creates new record with status :pending. Second user accepts/rejects and updates the record. [SO link](https://stackoverflow.com/questions/71986302/how-to-proceed-accept-and-reject-feature-with-rails)

* on FollowRequests controller on accepted_request action, it will update FollowRequest record status from :pending to :accepted and will also create a new record on FollowerFollowee table. All that must be in an ActiveRecord.transaction block see [docs](https://api.rubyonrails.org/classes/ActiveRecord/Transactions/ClassMethods.html)
* Add follow request form or link or w/e to profile
* Add pending requests panel to profile
# Search bar on feed find more people to follow

Use a search bar, use stimulus to show results on typing, details [on this vid](https://youtu.be/PfCU0Nni8fI?si=PIQbt8TGuJkAeuz1)
