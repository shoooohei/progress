module ConditionsHelper
  #diverの質問投稿のソースコードから必要なものをdocフォルダの中のそれぞれのファイルにコピペする
  #それの読み取り
  def read_original_lists(original)
    file = File.open("#{original}")
    text = file.read
    file.close
    return text
  end

  #タイトルの抜き出し
  def get_title(original_lists)
    #value=のあとの">"から探せばいいから、それのインデックスを求めて、なければnilを入れループを終了
    close_number = original_lists.index("value=")
    if close_number == nil
      return nil,0
    end
    #タイトルの抜き出し
    start_number = original_lists.index(">", close_number)
    end_number = original_lists.index("<", start_number + 1)
    title = original_lists.slice(start_number+1..end_number-1)
    return title, end_number
  end

  def make_lists(original)
    material_lists = Hash.new
    each_number = 1
    original_lists = read_original_lists(original)

    while true
      title, end_position = get_title(original_lists)
      #value=以下の">"がない、すなわちタイトルが抜き出し終わったらbreak
      break if title == nil
      material_lists["#{title}"] = each_number
      each_number += 1
      #最初にファイルから抜き取ったテキストから取得したタイトル部分を抜き取っていき、どんどん少なくしていく。
      original_lists = original_lists.slice(end_position..-1)
    end

    return material_lists
  end

  # 新しくconditionレコードを作成するときの選択肢。どこまで終わったかを選択
  def choose
    original = "doc/english_original_lists.txt"
    return make_lists(original)
  end


  #全体の進捗を計算するために全体のページ数を計算
  def number_of_pages
    original = "doc/japanese_original_lists_by_phase3.txt"
    return ((make_lists(original)).keys.length)
  end
end
