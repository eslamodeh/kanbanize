module Kanbanize::ClassMethods
  def all
    data = get

    case data.class.name
    when Array.to_s
      data.map { |attributes| new(attributes) }
    end
  end

  def print_errors(errors = [])
    errors.each do |error|
      puts "* #{error}".red
    end
  end
end
