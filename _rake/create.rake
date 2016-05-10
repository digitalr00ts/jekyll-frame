namespace :create do
  desc "Create a new post"
  task :post do
    title = ENV["title"] || "new-post"
    begin
      slug = parameterize(title)
      puts slug
    rescue => e
      abort ("Error: invalid characters in title")
    end

    begin
      date = ENV['date'] ? Date.parse(ENV['date']) : Date.today
    rescue => e
      abort ("Error: date format must be YYYY-MM-DD")
    end

    tags = ENV["tags"] || "[]"
    category = ENV["category"] || ""
    category = "\"#{category.gsub(/-/,' ')}\"" if !category.empty?

    filename = File.join("_posts", "#{date}-#{slug}.md")
    if File.exist?(filename)
      puts "Error: post already exists"
    end

    header = { "layout" => "post", "title" => title, "tags" => tags, "category" => category }
    content = header.to_yaml + "---\n"

    if IO.write(filename, content)
      puts "Post #{filename} created"
    else
      abort ("Error: #{filename} could not be written")
    end
  end

  desc "Create a new page"
  task :page do
    title = ENV["title"] || "new-page"
    begin
      slug = parameterize(title)
      puts slug
    rescue => e
      abort ("Error: invalid characters in title")
    end

    folder = ENV["folder"] || "."

    filename = File.join(folder, "#{slug}.md")
    if File.exist?(filename)
      abort ("Error: page already exists")
    else
      mkdir_p File.dirname(filename)
    end

    header = { "layout" => "page", "title" => title }
    content = header.to_yaml + "---\n"

    if IO.write(filename, content)
      puts "Page #{filename} created"
    else
      abort ("Error: #{filename} could not be written")
    end
  end
end
