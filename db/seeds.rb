languages = ["vim script", "1c-enterprise","abap","abnf","actionscript","ada","agda","ags-script","alloy","alpine-abuild","ampl","ant-build-system","antlr","apacheconf","apex","api-blueprint","apl","apollo-guidance-computer","applescript","arc","arduino","asciidoc","asn.1","asp","aspectj","assembly","ats","augeas","autohotkey","autoit","awk","batchfile","befunge","bison","bitbake","blade","blitzbasic","blitzmax","bluespec","boo","brainfuck","brightscript","bro","c","c#","c++","c-objdump","c2hs-haskell","cap'n-proto","cartocss","ceylon","chapel","charity","chuck","cirru","clarion","clean","click","clips","clojure","cmake","cobol","coffeescript","coldfusion","coldfusion-cfc","collada","common-lisp","component-pascal","cool","coq","cpp-objdump","creole","crystal","cson","csound","csound-document","csound-score","css","csv","gherkin","cuda","cycript","cython","d","d-objdump","darcs-patch","dart","desktop","diff","digital-command-language","dm","dns-zone","dockerfile","dogescript","dtrace","dylan","e","eagle","ebnf","ec","ecere-projects","ecl","eclipse","edn","eiffel","ejs","elixir","elm","emacs-lisp","emberscript","eq","erlang","f#","factor","fancy","fantom","filebench-wml","filterscript","fish","flux","formatted","forth","fortran","freemarker","frege","g-code","game-maker-language","gams","gap","gcc-machine-description","gdb","gdscript","genie","genshi","gentoo-ebuild","gentoo-eclass","gettext-catalog","gherkin","glsl","glyph","gn","gnuplot","go","golo","gosu","grace","gradle","grammatical-framework","graph-modeling-language","graphql","graphviz-(dot)","groovy","groovy-server-pages","hack","haml","handlebars","harbour","haskell","haxe","hcl","hlsl","html","html+django","html+ecr","html+eex","html+erb","html+php","http","hy","hyphy","idl","idris","igor-pro","inform-7","ini","inno-setup","io","ioke","irc-log","isabelle","isabelle-root","j","jasmin","java","java-server-pages","javascript","jflex","json","json5","jsoniq","jsonld","jsx","julia","jupyter-notebook","kicad","kit","kotlin","krl","labview","lasso","latte","lean","less","lex","lfe","lilypond","limbo","linker-script","linux-kernel-module","liquid","literate-agda","literate-coffeescript","literate-haskell","livescript","llvm","logos","logtalk","lolcode","lookml","loomscript","lsl","lua","m","m4","m4sugar","makefile","mako","markdown","mask","mathematica","matlab","maven-pom","max","maxscript","mediawiki","mercury","meson","metal","minid","mirah","modelica","modula-2","module-management-system","monkey","moocode","moonscript","mql4","mql5","mtml","muf","mupad","myghty","ncl","nemerle","nesc","netlinx","netlinx+erb","netlogo","newlisp","nginx","nim","ninja","nit","nix","nl","nsis","nu","numpy","objdump","objective-c","objective-c++","objective-j","ocaml","omgrofl","ooc","opa","opal","opencl","openedge-abl","openrc-runscript","openscad","opentype-feature-file","org","ox","oxygene","oz","p4","pan","papyrus","parrot","parrot-assembly","parrot-internal-representation","pascal","pawn","perl","perl6","php","pic","pickle","picolisp","piglatin","pike","plpgsql","plsql","pod","pogoscript","pony","postscript","pov-ray-sdl","powerbuilder","powershell","processing","prolog","propeller-spin","protocol-buffer","public-key","pug","puppet","pure-data","purebasic","purescript","python","python-console","python-traceback","qmake","qml","r","racket","ragel","raml","rascal","raw-token-data","rdoc","realbasic","reason","rebol","red","redcode","ren'py","renderscript","restructuredtext","rexx","rhtml","rmarkdown","robotframework","roff","rouge","rpm-spec","ruby","runoff","rust","sage","saltstack","sas","sass","scala","scaml","scheme","scilab","scss","self","shell","shellsession","shen","slash","slim","smali","smalltalk","smarty","smt","sourcepawn","sparql","spline-font-database","sqf","sql","sqlpl","squirrel","srecode-template","stan","standard-ml","stata","ston","stylus","sublime-text-config","subrip-text","supercollider","svg","swift","systemverilog","tcl","tcsh","tea","terra","tex","text","textile","thrift","ti-program","tla","toml","turing","turtle","twig","txl","typescript","unified-parallel-c","unity3d-asset","unix-assembly","uno","unrealscript","urweb","vala","vcl","verilog","vhdl","vim-script","vim-script","visual-basic","volt","vue","wavefront-material","wavefront-object","web-ontology-language","webidl","wisp","world-of-warcraft-addon-data","x10","xbase","xc","xcompose","xml","xojo","xpages","xproc","xquery","xs","xslt","xtend","yacc","yaml","yang","zephir","zimpl"]

puts "lets create Technolgies for all available Github programming languages, heyyy"

languages.each do |lang|
  Technology.new(name: lang, category: "bla").save!
end

puts "Languages created"
puts "Creating profiles..."

p1 = Profile.new(github_username: 'jro31')
p1.save!

puts "jro31 saved"

p2 = Profile.new(github_username: 'god')
p2.save!

puts "god saved"

p3 = Profile.new(github_username: 'dog')
p3.save!

puts "dog saved"
puts "Profiles created"
puts "Creating users..."

j = User.new(email: 'j@j.j', password: 'jjjjjj', first_name: 'Jethro', last_name: 'Williams', github_username: 'jro31')
j.save!

puts "j@j.j saved"

g = User.new(email: 'god@god.god', password: 'godgod', first_name: 'God', last_name: 'Clouds', github_username: 'god')
g.save!

puts "god@god.god saved"

d = User.new(email: 'dog@dog.dog', password: 'dogdog', first_name: 'Dog', last_name: 'Woof', github_username: 'dog')
d.save!

puts "dog@dog.dog saved"
puts "Users created"
puts "Creating user follow..."

uf = UserFollow.new(leader_id: 1, follower_id: 2)
uf.save

puts "User follow created"
puts "done habib"

# 4.times do
#   project = Project.new(
#     name: repo['name'],
#     private: repo['private'],
#     description: repo['description'],
#     primary_language: repo['language'],
#     size_bytes: repo['size'],
#     github_url: repo['html_url'],
#     url: repo['homepage'],
#     owner_id: repo['owner']['id'],
#     github_id: repo['id'],
#     url: repo['html_url']
#     )
#   project.save!
# end
