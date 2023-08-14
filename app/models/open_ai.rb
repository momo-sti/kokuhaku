class OpenAi
  require 'openai'

  def self.evaluate_confession(confession_text)
    client = OpenAI::Client.new

    # 20回に1回の確率で告白を受け入れる処理
    if rand(1..20) == 1
      # 受け入れる反応をOpenAIモデルに生成させる
      positive_response = client.chat(
        parameters: {
          model: 'gpt-3.5-turbo',
          messages: [
            { role: 'system', content: "あなたはツンデレな女の子として行動してください。今回の告白に対して、心の中で喜びを感じています。その喜びを「嬉しい」というワードを含めて30字以内で表現してください。" },
            { role: 'user', content: confession_text }
          ]
        }
      )
      puts "Positive Response: #{positive_response.inspect}"
      positive_result = positive_response.dig('choices', 0, 'message', 'content')
      return { status: 'success', message: positive_result, image_path: 'accepted.png' }
    end

    # それ以外の場合は、OpenAIモデルに入力し、モデルの反応を取得
    negative_response = client.chat(
      parameters: {
        model: 'gpt-3.5-turbo',
        messages: [
          { role: 'system', content: "あなたはツンデレな女の子として行動してください。素直になれない性格のため、告白に対する反応は選り好みします。ユーザーからの告白に対して、何かしら告白内容と関連した反応をして（内容の理解ができない場合のみ意味がわからないという趣旨の内容を伝えて一蹴する）、理由をつけて30字以内で強めに断ってください。（「あんたなんか好きじゃないんだからね！」というような口調で）" },
          { role: 'user', content: confession_text }
        ]
      }
    )
    puts "Negative Response: #{negative_response.inspect}"

    negative_result = negative_response.dig('choices', 0, 'message', 'content')
    negative_result ||= "理由は言えないけど、ダメだよ。"
    return { status: 'failure', message: negative_result, image_path: 'rejected.png' }
  end
end
