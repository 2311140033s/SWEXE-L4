class TopController < ApplicationController
  # main: ログイン状態によって表示切替
  def main
    if session[:login_uid].present?
      # ログイン中用の view を表示
      render :main
    else
      # ログインフォームを表示
      render :login
    end
  end

  # POST /top/login
  def login
    uid = params[:uid]
    pass = params[:pass]

    user = User.find_by(uid: uid)
    if user.nil?
      # ユーザ見つからない -> 失敗
      render :error, status: 422, locals: { message: "ログイン失敗：ユーザが見つかりません" }
      return
    end

    # user.pass は BCrypt で作った暗号文（文字列）
    if BCrypt::Password.new(user.pass) == pass
      session[:login_uid] = user.uid
      redirect_to action: :main
    else
      render :error, status: 422, locals: { message: "ログイン失敗：パスワードが違います" }
    end
  end

  def logout
    session.delete(:login_uid)
    redirect_to action: :main
  end

  def error
    # error view は login 失敗時に使う
  end
end
