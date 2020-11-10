Rails.application.routes.draw do
  
  devise_for :users
  root to: "items#index"
  resources :items, only: [:index, :new, :create]



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


# ルーティングにlocalhost::3000にアクセスしたときに「itemsコントローラーのindexアクション」が作動する様に設定する
# itemsコントローラーを作成しましょう。その後にindexアクションを定義してあげましょう
# 一度サーバーを抜けて再度rails sをしたときにトップページが開いていることを確認しましょう。