# Follow requests
* Make new table FollowRequests, columns user_id(follower issuing request), user_id(as followee to accept/reject req), a status column with (:pending, :accepted, :rejected). Sending a requests creates new record with status :pending. Second user accepts/rejects and updates the record.

* on FollowRequests controller on accepted_request action, it will update FolloRequest record status from :pending to :accepted and will also create a new record on FollowerFollowee table. All that must be in an ActiveRecord.transaction block see [docs](https://api.rubyonrails.org/classes/ActiveRecord/Transactions/ClassMethods.html)
