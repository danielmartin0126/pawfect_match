class User < ApplicationRecord
    has_many :relationships


    def partners
        @partners = self.relationships.map do |relationship|
            User.find(relationship.so_user_id)
        end 
        # @partners2 = self.relationships.map do |relationship|
        #     User.find(relationship.user_id)
        # end 
        # @partners = @partners1 << @partners2
        # @partners.flatten
    end

    # def partnered
    #     @partnered = Relationship.select(so_user_id: self.id)
    #     @partnered.map do |relationship|
    #         User.find(relationship.user_id)
    #     end 

    # end

end
