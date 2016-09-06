module Forum
  class CommentPolicy < ApplicationPolicy
    def update?
      !user.nil? && (comment.user.id == user.id || user.is_admin?)
    end

    def create?
      !user.nil?
    end

    def destroy?
      !user.nil? && (comment.user.id == user.id || user.is_admin?)
    end
  end
end