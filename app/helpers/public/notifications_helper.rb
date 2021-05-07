module Public::NotificationsHelper

  def notification_form(notification)
    @visitor = notification.visitor
    @visited = notification.visited
    @answer = nil
    @response = nil
    @visitor_answer = notification.answer_id
    @visitor_response = notification.response_id
    case notification.action
      when "follow" then
        tag.a(notification.visitor.name, href:member_path(@visitor), style:"font-weight: bold;")+"があなたをフォローしました"
      when "question_like" then
        tag.a(notification.visitor.name, href:member_path(@visitor), style:"font-weight: bold;")+"が"+tag.a('あなたの質問', href:question_path(notification.question_id), style:"font-weight: bold;")+"にいいねしました"
      when "answer" then
        @answer = Answer.find_by(id: @visitor_answer)&.content
        tag.a(@visitor.name, href:member_path(@visitor), style:"font-weight: bold;")+"が"+tag.a("あなたの質問", href:question_path(notification.question_id), style:"font-weight: bold;")+"に回答しました"
      when "answer_like" then
        tag.a(notification.visitor.name, href:member_path(@visitor), style:"font-weight: bold;")+"が"+tag.a('あなたの回答', href:question_path(notification.answer.question_id), style:"font-weight: bold;")+"にいいねしました"
      when "response" then
        @response = Response.find_by(id: @visitor_response)&.content
        tag.a(@visitor.name, href:member_path(@visitor), style:"font-weight: bold;")+"が"+tag.a('あなたの回答', href:question_path(notification.answer.question_id), style:"font-weight: bold;")+"にコメントしました"
    end
  end

  def unchecked_notifications
    @notifications = current_member.passive_notifications.where(checked: false)
  end

end
