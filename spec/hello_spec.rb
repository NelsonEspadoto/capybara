describe "Meu primeiro script" do
    before(:each) do
        page.current_window.resize_to(1280, 800)
    end
    
    it "visitar a página" do
        visit "/"
    end
end