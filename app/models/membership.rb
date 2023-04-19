class Membership < ApplicationRecord
    belongs_to :gym
    belongs_to :client

    validate :double_gym_membership?

    def double_gym_membership?
        if Membership.where(client_id: client_id).find_by(gym_id: gym_id)
            errors.add(:gym_id, "Duplicate membership")
        end
    end

end
