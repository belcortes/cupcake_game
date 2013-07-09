# == Schema Information
#
# Table name: identities
#
#  id         :integer          not null, primary key
#  provider   :string(255)
#  secret     :string(255)
#  uid        :string(255)
#  user_id    :integer
#  user_name  :string(255)
#  expires_at :datetime
#  name       :string(255)
#  image      :string(255)
#  url        :string(255)
#  token      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Identity do
  pending "add some examples to (or delete) #{__FILE__}"
end
