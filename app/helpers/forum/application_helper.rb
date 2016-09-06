module Forum
  module ApplicationHelper
    def emoji_image(tag)
      "emoji/#{Emoji.find_by_alias(tag).image_filename}"
    end

  end
end
