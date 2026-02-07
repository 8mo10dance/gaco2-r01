class Micropost
  def initialize(filename:, **options)
    @filename = filename
    @options = options
  end

  def upload_url
    url = bucket.object(path).presigned_url(:put, @options)
    URI(url)
  end

  private

  def bucket
    @bucket ||= s3.bucket('microposts')
  end

  def s3
    @s3 ||= Aws::S3::Resource.new(
      endpoint: 'http://host.docker.internal:4566',
      force_path_style: true,
    )
  end

  def path
    "#{base_dir}/#{@filename}"
  end

  def base_dir
    "uploads/#{uuid}"
  end

  def uuid
    SecureRandom.uuid
  end
end
