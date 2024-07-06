class CreatePosts
  def initialize(dry: true)
    @dry = dry
  end

  def execute!
    logger = Logger.new(STDOUT)

    ApplicationRecord.transaction do
      logger.info('Post を登録します')
      %w[hoge fuga piyo].each do |content|
        Post.create!(content:)
      end
      logger.info('Post を登録しました')

      if @dry
        logger.info('ロールバックします')
        raise ActiveRecord::RecordInvalid
      end
    end
  end
end

CreatePosts.new(dry: ARGV[0] != '--force').execute!
