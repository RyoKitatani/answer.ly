module Public::NotificationsHelper

  def notification_form(notification)
    @visitor = notification.visitor
    @answer= nil
    your_item = link_to 'あなたの投稿', question_path(notification), style:"font-weight: bold;"
    @visitor_comment = notification.answer_id
    case notification.action
      when "follow" then
        tag.a(notification.visitor.name, href:member_path(@visitor), style:"font-weight: bold;")+"があなたをフォローしました"
      when "question_like" then
        tag.a(notification.visitor.name, href:member_path(@visitor), style:"font-weight: bold;")+"が"+tag.a('あなたの投稿', href:question_path(notification.question_id), style:"font-weight: bold;")+"にいいねしました"
      when "answer" then
        @answer = Answer.find_by(id: @visitor_comment)&.content
        tag.a(@visitor.name, href:member_path(@visitor), style:"font-weight: bold;")+"が"+tag.a('あなたの投稿', href:question_path(notification.question_id), style:"font-weight: bold;")+"にコメントしました"
    end
  end

  def unchecked_notifications
    @notifications = current_member.passive_notifications.where(checked: false)
  end

end
