json.text  @comment.text
json.user_id  @comment.user.id
json.user_name  @comment.user.nickname
json.date  @comment.created_at.strftime("%Y年%m月%d日 %H時%M分")