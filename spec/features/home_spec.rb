require "rails_helper"

def filler_text1
  "Vix ubique minimum in. Aeque oblique conclusionemque quo in, sit movet eligendi
  in, et vel putent aliquid singulis. Aperiam inimicus te sed, fabulas consequat eam
  te, volumus consulatu dissentias ei eum. Singulis inimicus et sit, mediocrem consequat
  ei cum, in vis mutat iusto. Eu enim imperdiet scribentur eum, alii soluta ei nec.
  Id vim quaeque signiferumque. Eum ne scripta scriptorem. Ut usu case facete, ex latine
  volumus reformidans per. Sit ut cetero inimicus. Cu facer nonumes atomorum nam, vim
  delenit contentiones ei."
end
def filler_text2
  "No quem dicunt contentiones usu, essent fastidii abhorreant in cum. Rebum cotidieque
cu sed. Enim case luptatum ut vis, vim dicit percipitur at, veri graece facilis sed id.
Ea adhuc vitae sea. Et ius dolor decore verear, vim case prima soleat cu. Oblique iudicabit
his ut, modo graecis sapientem usu at, ignota nominavi vix ea.
Autem ancillae copiosae ad mea, nam id zril feugait quaerendum, mel te lorem dicant nonumy.
Cum ea regione omnesque delicatissimi, ea aliquid probatus recusabo pri. Cum ut mazim
definitionem, alia dolorem placerat ut nam, ne vis partiendo dignissim neglegentur. Eu vel
solum recteque, te mel electram scripserit definitionem. Eu vix dolor disputationi, ad eam
mentitum patrioque, contentiones intellegebat mei ex."
end
def filler_text3
  "An assum solet constituto vel, malorum electram eu qui. Ne vis timeam legimus. Et nec
numquam tacimates expetenda, vis ut accusata conceptam, qui summo mundi te. Decore feugait
ut his, pri ex probatus mediocrem, per ea nibh eirmod. Dicta albucius tractatos eu pro, ea
ius dicam libris feugait.
Sit singulis legendos instructior ea. Nemore malorum an sea, per ridens delicata partiendo
te, dicam inermis ponderum vix ei. Cu accusata conclusionemque qui, ex oblique eligendi per.
Ne usu elit probo facilisis. Quis prompta senserit eum ex."
end
def filler_text4
  "Quo ea novum salutandi, ipsum maiestatis no usu, audiam sanctus fabellas eu eam. Eum id
quis quaestio, reque apeirian sententiae sit no. Cu duo iisque splendide. Erant munere
assueverit ut mel, fabulas disputando te est. Bonorum inermis adipiscing vis ne, eos an
admodum petentium, est brute nonumes ne. Oratio essent volutpat an pro, cu cum dicam facete,
nibh option epicurei vel at.
Everti laboramus incorrupte eum te. Et pri legere populo definitionem, in sit audiam
maluisset. In has tota reprehendunt. An qui quas omnes, labore democritum deseruisse ex eam.
Te dicat ludus lucilius vix, ut soluta ocurreret pri."
end
def filler_text5
  "Eum cu nisl fierent, duo meis equidem ei, sit cu minim mollis. Nonumy vivendo eleifend
mea ad, ius definiebas delicatissimi ei. Id purto voluptatum referrentur sea, usu eripuit
oportere id, nusquam liberavisse eam ne. Dolorum deseruisse ea pri. Vis eu veri elitr
euripidis, no assum doctus fuisset pro.
Per in suas melius audire. Vim ea volutpat moderatius. Quo id dolore ceteros, mel percipit
sententiae cu. Ne iriure detraxit dignissim eam, ea eam facilis euripidis repudiandae, eos
nobis intellegat at."
end
def filler_text6
  "Volutpat salutatus honestatis his no, adhuc tempor eu mei. Duo ad semper laboramus,
ut quidam deseruisse sea. Cu usu iusto prodesset, nec admodum incorrupte et, no aliquip
labitur similique est. Est no tale bonorum intellegam, his et omnis consequuntur. Quem
doctus latine usu id, ad invidunt comprehensam duo.

Duo an exerci electram democritum, ex etiam elaboraret eos. Quod vide luptatum eos no.
Bonorum patrioque ad usu, at volumus dignissim vim. Ea feugait deterruisset sit, mea
perfecto intellegam ad."
end
def filler_text7
  "Menandri sadipscing vim id, eam dicta veniam ne, vix ea autem epicuri expetendis. Cetero
eligendi sea eu. Eligendi efficiantur ad cum, ex alia dolorem eam, eu prodesset intellegat
eos. Est unum solet quaeque te, sea ne sint dolorum inciderint. Novum putant mel an, ex ius
unum labore.
An vim prima summo, solum suavitate assueverit ex pri. Id laudem moderatius eos. At quo
nemore lucilius, illud perfecto conceptam est te, qualisque cotidieque te sea. At has
principes persecuti. Ut phaedrum persecuti sea, oporteat lobortis eum an."
end
def create_wes_welker
  register("Welker", "pass123", "Wes", "Welker", "Awesome Bronco WR", "user_rant_frequency_weekly")
end
def register(username, password, first_name, last_name, bio, frequency)
  visit root_path
  click_link "JOIN"
  fill_in "Username", with: username
  fill_in "Password", with: password
  fill_in "First name", with: first_name
  fill_in "Last name", with: last_name
  fill_in "Bio", with: bio
  # Choose radio button, but radio input html id
  choose frequency
  click_button "Register"
end
def login(username, password)
  visit root_path
  click_link "Login"
  fill_in "Username", with: username
  fill_in "Password", with: password
  click_button "LOGIN"
end
def logout
  click_link "Logout"
end
def create_rant(title,rant)
  visit root_path
  fill_in "A rant about:", with: title
  fill_in "Rant:", with: rant
  click_button "RANT"
end

describe "Visiting the home page" do
  it "shows the homepage" do
    visit root_path
    expect(page).to have_content("Rantly")
    expect(page).to have_content("Let it all out")
    expect(page).to have_content("Jeff Taggart")
    expect(page).to have_content("Rantly has allowed")
  end
end

describe "Registering with Rantly. =>" do
  before :each do
    visit root_path
    click_link "JOIN"
  end
  it "clicking the join button." do
    expect(page).to have_content("Register")
    expect(page).to have_content("Username")
    expect(page).to have_content("Password")
    expect(page).to have_content("First name")
    expect(page).to have_content("Last name")
  end
  it "Complete registration and see flash message" do
    create_wes_welker
    expect(page).to have_content("Rant.ly")
    expect(page).to have_content("Let it all out")
    expect(page).to have_content("Thank you for registering!")
  end
  it "Username must be unique, and non-blank" do
    create_wes_welker
    create_wes_welker
    expect(page).to have_content("Username has already been taken")
    register("", "pass123", "Wes", "Welker", "Awesome Bronco WR", "user_rant_frequency_weekly")
    expect(page).to have_content("Username can't be blank")
  end
end

describe "Login with Rantly. =>" do
  before :each do
    create_wes_welker
  end
  it "clicking the login button." do
    visit root_path
    click_link "Login"
    expect(page).to have_content("Login")
    expect(page).to have_content("Username")
    expect(page).to have_content("Password")
    expect(page).to have_button("LOGIN")
  end
  it "login and see flash message" do
    login("Welker", "pass123")
    expect(page).to have_content("Welcome back Wes")
  end
end

describe "Create Rant =>" do
  before :each do
    create_wes_welker
    login("Welker", "pass123")
  end
  it "Rant can be submitted" do
    create_rant("Title", filler_text1)
    expect(page).to have_content("Rant Created")
  end
  it "Cant submit short rant." do
    create_rant("Title", "Short Rant")
    expect(page).to have_content("Rant must be at least 140 characters")
  end
  it "Cant submit rant without title." do
    create_rant("", filler_text1)
    expect(page).to have_content("Rant must be at least 140 characters")
  end
end

describe "My Rants on the dashboard. =>" do
  before :each do
    register("Payton", "pass123", "Payton", "Manning", "The Greatest QB", "user_rant_frequency_monthly")
    create_wes_welker
    login("Welker", "pass123")
  end
  def create_three_rants
    create_rant("Title1", filler_text1)
    create_rant("Title2", filler_text2)
    create_rant("Title3", filler_text3)
  end
  it "My last three rants can be seen" do
    create_three_rants
    expect(page).to have_content(filler_text1)
    expect(page).to have_content(filler_text2)
    expect(page).to have_content(filler_text3)
  end
  it "Rant1 cannot be seen after three more rants are made" do
    create_three_rants
    create_rant("Title4", filler_text4)
    expect(page).to_not have_content(filler_text1)
  end
  it "Rant can be deleted" do
    create_rant("Title1", filler_text1)
    expect(page).to have_content(filler_text1)
    click_link "Delete"
    expect(page).to_not have_content(filler_text1)
  end
  it "Rant can be favorited and unfavorited" do
    create_rant("Title", filler_text1)
    click_link "Logout"
    login("Payton", "pass123")
    click_link "Favorite"
    save_and_open_page
    click_link "Favorites"
    expect(page).to have_content(filler_text1)
    save_and_open_page
    click_link "Unfavorite"
    expect(page).to_not have_content(filler_text1)
  end
end