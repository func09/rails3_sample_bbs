# -*- coding:utf-8 -*-

Board.delete_all
Forum.delete_all
Message.delete_all

# 5個の板
['ニュース速報+','痛いニュース','ラウンジ', 'ボランティア','氏・ポエム'].each do |name|
  Board.create :title => name
end

forum_names = [
  '俺レミオメロンだけどおまえら何メロン？',
  'ものすごい勢いで墓を掘ってる動画をください',
  'うわぁ・・・花王の中・・・すごく清潔で美しい・・・',
  'ボクの肛門も閉鎖されそうです',
  '昼でもヨルダン',
  '志村ー！上、上、下、下、左、右、左、右、Ｂ、Ａ！',
]

Board.all.each do |board|
  10.times do |i|
    name = forum_names.shuffle.first
    forum = board.forums.create :title => "#{name} #{rand(99)}"

    100.times do
      random = rand(999)%2 > 0
      forum.messages.create :name => nil,
      :email => random ? 'sage' : '',
      :body => 'あいうえお'
    end
    
  end
end

