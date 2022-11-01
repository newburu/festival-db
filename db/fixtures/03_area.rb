id = 1

# 恵美酒宮天満神社
names = %w(東堀 都倉 御幸 栄町 玉地 清水 北細江 小瀬)
colors = %w(白・赤 赤 黄 橙 桃 緑 青 紫)
shrine_id = 1
names.each_with_index do |name, idx|
  color = colors[idx]
  Area.seed(
    {
      id: id,
      shrine_id: shrine_id,
      name: name,
      color: color,
    },
  )
  id += 1
end

# 浜の宮天満宮
names = %w(須加 宮町 天神 大浜 川内細江 西細江 中細江 港 南細江)
shrine_id = 2
names.each do |name|
  Area.seed(
    {
      id: id,
      shrine_id: shrine_id,
      name: name,
    },
  )
  id += 1
end

# 曽根天満宮
names = %w(曽根東ノ丁 曽根西ノ丁 曽根南ノ丁 曽根北ノ丁 伊保西部 伊保中部 伊保南部 高須 梅井 中筋東 中筋西)
colors = %w(赤 黄 白・緑 白・黄 黄・緑 緑 白・青 桃 緑 赤 白・赤)
shrine_id = 3
names.each_with_index do |name, idx|
  color = colors[idx]
  Area.seed(
    {
      id: id,
      shrine_id: shrine_id,
      name: name,
      color: color
    },
  )
  id += 1
end

# 大塩天満宮
names = %w(東之丁 宮本丁 中之丁 西之丁 北脇丁 西濱丁 牛谷 小林)
colors = %w(青 赤 白・紺 黄 白・赤 緑 赤紫 桃)
shrine_id = 4
names.each_with_index do |name, idx|
  color = colors[idx]
  Area.seed(
    {
      id: id,
      shrine_id: shrine_id,
      name: name,
      color: color
    },
  )
  id += 1
end

# 松原八幡神社
names = %w(旧東山村 旧八家村 木場港 旧宇佐崎村 旧中村 𦾔松原村 妻鹿町)
colors = %w(桃 赤・黄 緑 黄 水色 赤 朱色)
shrine_id = 5
names.each_with_index do |name, idx|
  color = colors[idx]
  Area.seed(
    {
      id: id,
      shrine_id: shrine_id,
      name: name,
      color: color
    },
  )
  id += 1
end

# 魚吹八幡神社
names = %w(吉美 平松 天満 長松 西土井 朝日谷 熊見 宮田 丁 大江島 垣内 興濵 新在家 余子濱 坂出 坂上 高田 津市場北 津市場 福井 和久 駅前 田井 宮内 糸井)
colors = %w()
shrine_id = 6
names.each_with_index do |name, idx|
  color = colors[idx]
  Area.seed(
    {
      id: id,
      shrine_id: shrine_id,
      name: name,
      color: color
    },
  )
  id += 1
end

# 富嶋神社
names = %w(苅屋 濱田南 濱田西 黒崎 東釜屋)
colors = %w()
shrine_id = 7
names.each_with_index do |name, idx|
  color = colors[idx]
  Area.seed(
    {
      id: id,
      shrine_id: shrine_id,
      name: name,
      color: color
    },
  )
  id += 1
end

# 荒川神社
names = %w(町坪 中地 玉手 岡田 井ノ口 西庄)
colors = %w(白 緑 青 赤 桃 黄)
shrine_id = 8
names.each_with_index do |name, idx|
  color = colors[idx]
  Area.seed(
    {
      id: id,
      shrine_id: shrine_id,
      name: name,
      color: color
    },
  )
  id += 1
end
