
new_title = []


# def kebab_convert(project_title)

#   new_title = []

#   title = project_title
#   split_title = title.split(/([A-Z])/)

#   split_title.each do |w|
#     new_title << w.capitalize
#     new_title << " "
#   end
#   p new_title.join.strip
# end

# kebab_convert("ThisIsATestCamelCase")


def kebab_convert(project_title)

  new_title = []

  title = project_title
  split_title = title.split(/([A-Z])/)

  p split_title

  split_title.each do |w|
    # new_title << " "
    new_title << w
  end
  p new_title.join.strip
end

kebab_convert("ThisIsATestCamelCase")
