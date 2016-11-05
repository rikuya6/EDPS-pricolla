class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :img]
  before_action :auth, only: [:index, :show, :new, :sv, :pk, :dq]

  # GET /pictures
  # GET /pictures.json
  def index
    @pictures = Picture.where(key: params[:key])
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    type = @picture.temp_type
    key = @picture.key
    # ToDo ファットコントローラを殺す
    case type
      when 0
        json = ' {
                "temp": "1 に 2 すんでいる。 3 が 4 ため 5 を 6 という。 ",
                "1": ["もりのなか", "うみのなか", "くうちゅう", "うちゅう", "なぞのばしょ",
                  "スカートのなか", "くさむら", "さばく", "どくぬま", "みずうみ", "どうくつ",
                  "シオンタウン", "カミナリぐも", "マグマの　なか", "１ごうかん", "いくたりょくち",
                  "２じげん", "たんまつしつ", "グリーントップ", "マルメ"
                ],
                "2": ["ひとりで", "むれをなして", "なかまと", "かぞくと", "しゅうだんで", "ぼっちで",
                  "こいびとと", "ともだちと"
                ],
                "3": ["ウロコ", "きんにく", "ツノ", "トゲ", "しっぽ", "つばさ", "さいぼう", "はっぱ",
                  "はなびら", "たいもう", "ツメ", "ヒゲ", "みずかき", "ないぞう", "くち", "おしり",
                  "しょくしゅ", "ベロ", "せびれ"
                ],
                "4": ["かたい", "はったつしている", "ふくらんでいる", "くさい", "うつくしい",
                  "おおきくなる", "ぜんしんを　おおう", "つよい", "するどい", "たくましい",
                  "すけている", "ぬれている", "すごい"
                ],
                "5": ["インドゾウ", "ドラムかん", "てっとう", "てっこつ", "ほかの　ポケモン",
                  "じゅうでんき", "メガネ", "きんメダリスト", "ゴローン", "イシツブテ",
                  "ユーエスビー", "カイリキー", "にんげん", "１トンの　いわ", "モンスターボール",
                  "せいみつきかい", "はつでんしょ", "タマタマ", "せかいチャンピオン", "かだい",
                  "マックブック"
                ],
                "6": ["もちあげる", "へしおる", "おそう", "あふれさせる", "たべる", "つくる", "こわす",
                  "はかいする", "つかまえる", "のみこむ", "まっぷたつにする", "もやす",
                  "なぎたおす", "あやつる", "ぜつめつさせる", "ほろぼす"
                ]
               }'
        json = JSON.parse(json)
        @data = {
            text: json["temp"].gsub('1', json["1"].sample).gsub('2', json["2"].sample).gsub('3', json["3"].sample).gsub('4', json["4"].sample).gsub('5', json["5"].sample).gsub('6', json["6"].sample),
            ashi: rand(1..9),
            weight: rand(0..256),
            tall: rand(0..300).to_f / 100.0,
            num: "%03d" % rand(1..999),
            type: %w(ねがく がくせい うぇい).sample,
        }
        render layout: 'pk' and return
      when 1
        json = '{
                "temp": "1で2をしていたところ　なかまになった。\nとくぎは3で　 こうぶつは4である。\nせいちょうすると　5と6がおおきくのびていく。",
                "1": ["アトリウム", "ビュー", "キャビン", "スエヒロ", "ホワイエ", "ぶしつ"],
                "2": ["かだい", "どくしょ", "おひるね", "べんきょう", "おしゃべり", "ゲーム", "ダンス", "ランチ", "ディナー"],
                "3": ["メラ", "メラゾーマ", "ヒャド", "マヒャド", "バギ", "バギクロス", "イオ", "イオグランデ", "ギガデイン", "マヒャデドス", "ホイミ", "ベホマラー", "ザオリク", "マホカンタ", "バイキルト", "マダンテ"],
                "4": ["やくそう", "アモールのみず", "いやしぐさ", "せかいじゅのは", "まほうのせいすい", "どくけしそう", "ばんのうやく", "いのちのきのは", "まんげつそう", "きつけぐさ", "ちからのたね", "まもりのたね", "スタミナのたね", "かしこさのたね"],
                "5": ["HP", "MP", "ちから", "すばやさ", "たいりょく"],
                "6": ["かしこさ", "うんのよさ", "さいだいHP", "さいだいMP", "こうげきりょく", "しゅびりょく"]
              }'
        json = JSON.parse(json)
        @data = {
            text: json["temp"].gsub('1', json["1"].sample).gsub('2', json["2"].sample).gsub('3', json["3"].sample).gsub('4', json["4"].sample).gsub('5', json["5"].sample).gsub('6', json["6"].sample),
            sex: %w(おとこ おんな ふめい).sample,
            job: %w(がくせい にーと).sample,
            lv: rand(0..99),
            hp: rand(1..255),
            mp: rand(1..255),
            power: rand(1..255),
            speed: rand(1..255),
            pp: rand(1..255),
            clever: rand(1..255),
            lucky: rand(1..255),
            exp: rand(1..10000),
        }
        render layout: 'dq' and return
      when 2
        json = '{"ability":["ファンファーレ","ネクロマンス","ラストワード",
                  "覚醒","カウントダウン","復讐","土の秘術","レポート提出時","授業開始時","授業終了時"],
        "secondAbility":["守護","突進","疾走","ドレイン","潜伏","必殺","　"],
        "nickname" : ["漆黒ノ戯者","みんなのANGEL","八方美人","わがまま","純潔ノ護者","恋に恋する","暗殺者","孤高の狼","賢者","〆切絶護シ者","単位堕落者",
                  "髪金染シ者","課題囚ノ身","頭ﾊｯﾋﾟｰﾀｰﾝ","エルフの少女","リンゴン使い","森隠れの","変態魔人","フェアリー","妄想恋愛熟練","彼女(借り)",
                  "蝿の王","んンゴゴォw","カレーパン","眷属の使い"],
        "cont":["サークル姫囲い隊を場が上限枚数になるまで出す。(上限は無限)","とりあえず教室に着いたらTwitterを開く。","彼女ができる（画面の中に）。",
          "溜めてたリフレクションシートで感想を提出する。","般教の隣に可愛い他学部生２体を出す。","よっ友の他学部の友達がイケメンになる。",
          "単位を落とす","ダイリ・シュッセキマン１体を出す。","トイレでリバースして蘇る。そう、俺は不死鳥。リザレクション！",
          "レポート出すまで欠席扱いされる。","同じ教室にいるのに気づかれない。","一般教養の教室ではMBAを使えない。",
          "何故かテンションが上がる夜３時。","モンスターエナジーを補給してまだ舞える。","授業終わり前かがみ男子。",
          "年齢＝彼女いない歴が+１される。","レポートの提出期限が少しずつ迫ってくる。","１限英語の欠席数が＋１される。",
          "クリスマス、周りにはカプゥールばかり。","ヴァンピィちゃんの可愛さにやられる。","Gold Fingerによって絶対に〇〇される。",
          "再再履。君（単位）の名は...。","成績59点で落とした教授許さない...。","100円朝食目の前で終了する。",
          "カーディガンヴァンピィちゃんを出す。","カーディガンJKを出す。","カーディガンJCを出す。",
          "提出期限が昨日だったことに気づく。","文字数が足りないことに気づく。","CoursePowerが重くなる。",
          "ぽやしみww　単位が消滅する。","PCの起動音を鳴り響かせる。","Twitterを開いてTLチェック。",
          "ぽきたww　リフレクションシートが出せなかった。","Twitterを開いてTLをチェックする。","授業内課題に気づく。"]}'
        json = JSON.parse(json)
        @data = {
            cost: rand(1..10),
            at: rand(0..10),
            hp: rand(0..10),
            class: %w(学生 ネ学生 うぇい).sample,
            at_af: rand(0..10),
            hp_af: rand(0..10),
            nickname: json["nickname"].sample,
            ability: json["ability"].sample,
            sec_ability: json["secondAbility"].sample,
            cont: json["cont"].sample
        }
        render layout: 'sv' and return
      when 3
        json = '    {"nickname" : ["清純令嬢","ふわふわ天使","単位パーティー","履中・モード","サンシャインビーチ","永遠の17さい","メルヘンチェンジ","永遠のプリンセス","鳳の思い出","貴方を想う","カリスマギャル",
                      "はじめてのデート","課題パーティー","ショコラプリンセス","夢のひととき","スウィートガール","ハッピースマイル","純愛少女","片思いの","妄想狂想曲","赤い糸",
                      "アニメオタク","焼肉キングダム","憧れの先輩","気になる転校生","結婚前夜","見習いパティシエ","花屋のお姉さん","アルバイター","新社会人","歌い手","プリティガール","恋する乙女",
                      "弾ける若さ","みんなのお姉さん","女子会モード","バラ色人生","恋煩い","お家にかえりたい","セクシーガール","落単パーティー","恋知らぬ少女","甘い誘惑","リズミカルガール","魅惑の乙女","終電を逃す"],
            "lines" : ["みんなに届け！ラブリーハートっ♪キュートでピュアな新人アイドルですっ！これからもずっとずっと、幸せな時間を私と一緒に過ごしましょうねっ！",
                       "私、やっとアイドルになれたんですね…！緊張でドキドキした気持ちもありますけど、それ以上に嬉しくて楽しくて！ステージ、見ていてくださいね！",
                       "そのとき、みんなの声援でメルヘンチェンジしたのだっ！みんなー、キュートパワーで私に応援よろしくねーっ。さぁ、いっしょにーっ、ブイッ♪",
                       "新しい私に挑戦してみたい。アイドルになるのもひとつの経験だと思っています。でもちょっとだけ緊張、プロデューサーさん、私の成長、見守っててくださいね",
                       "かわいいもの、だーい好き！アイドルってかわいい服着られて、かわいい歌とかダンス、やらせてもらえるんだよね！わーいっ！はやくアイドルになりたいな！",
                       "アイドルになってもボクのカワイさは変わらない、いや、今まで以上ですね！プロデューサーさんも喜んでください！ボクのカワイさをみんなに伝えるんです♪",
                       "みんなお待たせぇ☆スウィーティーな、しゅがーはぁとの登場だよ♪みんなに幸せのハートをプレゼントしちゃう☆そぉーれっ☆ってほらそこ避けんなぁ〜♪",
                       "みんなに「元気でかわいいね」って言われたよ！せんせぇが、わたしのことたくさんほめてくれたからだよね！これからもっと元気でかわいいアイドルになるね！",
                       "これがアイドル…それにステージ。こんなに生きていると感じられることがあるんだね。ボクはもうあの味をしってしまったから…キミも後戻りはできないよ？",
                       "本気でなにかを目指したことなかった気がする…。アイドルは私の初めての目標になるのかな。走り出した以上、止まる気はないから。ついてきてね、プロデューサー",
                       "プロデューサーさん、わかりましたよっ。アイドルはトップアイドルになるんですよねっ。それでプロデューサーさんが…？それで？何するんでしたっけ",
                       "衣装を着るとこんなに気持ち…変わるんだ。マイクを握ると…チェーンソーを持ってるモンスターみたいに強気で…。夢、見せてあげる。あ、悪夢かもしれないけど…！",
                       "これがあアタシらしいアイドルの姿！そう、アタシ変わったんだ…！アイドルとして今度は世界を変える歌を歌う！目指すは、ヒーロー番組の主題歌だ！",
                       "…プロデューサーさんって…本当にプロデューサーだったのですね。…実感はないのですが…アイドルとしての素敵な物語を、記していけたら、と。",
                       "どうやら目覚めの日が来たようね。これまでの歩みは、ほんの序章。堕天使の衣を得て…いよいよ飛翔のときよ（本気をやるのは、ここからですよね。がんばりまーす！）",
                       "ふっふっふ、サイキックアイドルの登場です！プロデューサーに、奇跡の瞬間を見せてあげましょう！トップアイドルへ駆け上がる、ミラクルをね！",
                       "えへへ、どうかな、プロデューサー。私もアイドルになって、元気に磨きがかかっちゃた感じでしょ！この調子でどんどんファンを増やしていこーっ☆",
                       "私が知らなかった才能を、プロデューサーさんはちゃんと育ててくれたね！だから私も全力で応えたい！ステージで咲いてみせるから…見ててねっ♪",
                       "にょっわー！わたしのアイドル衣装！もう、きゅんきゅんすぎて、ヤバーい☆うぇへへ…！これでみんなをもーっとハピハピにしちゃおう！",
                       "よーしっ。いよいよ本番っ、あたしの出番だねっ。みんなからもらっている応援を、わたしはステージでお返しするんだっ、エイ・エイ。オー！",
                       "わたしほどこの役が似合うアイドルもいないんじゃないかしら。いいわ。このミッション、完璧にこなしてあげる。本気には本気で答える。そういうものよ",
                       "ラブリーエンジェル・アラモード♪茶目っ気、クセっ毛、オシャっ気。ワガママ気ままで、ありのまま。フレンチ小悪魔、しるぶぷれー？",
                       "にゃーっはっは！いつもの白衣を着たら抑えられるかなって思ったけど…ムリかも！抑えきれないこのフェロモン…勢いあまってファンに注入〜♪",
                       "アイドルなんて…夢物語だと思ってた。でもアタシはここにいる。「信じてくれれば夢は叶う」って教えてくれたのはプロデューサーだよ。これからもっと輝くから！",
                       "このステージはジャールカァ…暑いですね。青空、太陽、それからファンの応援でたくさん…♪私の楽しい声、きっと遠くまで届きますね！",
                       "ミラクルパーティーのはじまりにゃ〜♪さあネコチャンたち、出ておいでー！星明かりの下で、わたしと朝まで踊り明かすのにゃ〜♪"],
            "center" : ["再履アイドルのダンスアピール値を90％アップ",
                        "再履アイドルのビジュアルアピール値を30％アップ",
                        "再履アイドルのボーカルアピール値を90％アップ",
                        "再履アイドルのすべてのアピール値を10％アップ",
                        "履中アイドルのすべてアピール値を90％アップ",
                        "履中アイドルのダンスアピール値を30％アップ",
                        "履中アイドルのボーカルアピール値を20％ダウン",
                        "履中アイドルのダンスアピール値を90％ダウン",
                        "楽単アイドルのダンスアピール値を40％アップ",
                        "楽単アイドルのダンスアピール値を90％アップ",
                        "落単アイドルのすべてのアピール値を100％ダウン",
                        "落単アイドルのボーカルアピール値を90％アップ",
                        "特になし",
                        "すべてのアイドルのすべてのアピール値を30％アップ"],
             "skill" : ["4秒毎、高確率で、出席していない講義の単位が必ず取れる",
                        "7秒毎、低確率で、他学部の美少女から挨拶される",
                        "11秒毎、高確率で、ツイートがバズる",
                        "5秒毎、高確率で、リフレクションシートが余分にまわってくる",
                        "8秒毎、低確率で、友人が彼女とイチャつく",
                        "10秒毎、ごく稀な確率で、耳から千円札が出てくる",
                        "4秒毎、高確率で、どうでもいい相手からラインが届く",
                        "６秒毎、高確率で、「もう家に帰りたい」と思う",
                        "4秒毎、低確率で、休講のお知らせを確認したくなる",
                        "7秒毎、高確率で、必修の単位を落とす",
                        "8秒毎、低確率で、卒業を心配される",
                        "10秒毎、高確率で、将来に不安を抱く",
                        "14秒毎、低確率で、この娘、自分に気があるんじゃないかと勘違いをする",
                        "4秒毎、ごく稀な確率で、コメントシートを消しゴムでこすって破く"]}'
        json = JSON.parse(json)
        @data = {
            vocal: rand(0..6000),
            dance: rand(0..6000),
            visual: rand(0..6000),
            nickname: json["nickname"].sample,
            text: json["lines"].sample,
            center: json["center"].sample,
            skill: json["skill"].sample,
            plus: ["+", "", "?"].sample,
        }
        render layout: 'ds' and return
    end
    render :nothing and return
  end

  def sv
  end

  def img
    # kit = IMGKit.new("http://#{request.host_with_port}/pictures/#{params[:id]}?key=#{params[:key]}")
    kit = IMGKit.new("http://localhost:3000/pictures/12?key=dJHq0xuQ")
    # kit = IMGKit.new("http://google.com")
    # send_data(kit.to_png, :type => "image/png", :disposition => 'inline')
    send_data(kit.to_png, :type => "image/png", :disposition => 'inline')
  end

  def pk
  end

  def dq
  end

  # GET /pictures/new
  def new
    @picture = Picture.new(key: params[:key])
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @picture = Picture.new(picture_params)
    respond_to do |format|
      if @picture.save
        format.html { redirect_to picture_path(@picture, key: @picture.key), notice: 'Picture was successfully created.', params: @picture.key }
        format.json { render :show, status: :created, location: @picture }
      else
        format.html { render :new }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.require(:picture).permit(:name, :key, :temp_type, :photo)
    end

    def auth
      key = params[:key]
      user = User.find_by(key: key)
      if user
        @user = user
      else
        throw(:abort)
      end
    end
end
