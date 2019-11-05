# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'These website' do
  describe 'home page' , js:true do
    before do
      visit 'https://gen.uy.sura.uat.ctplc.ltd:9074/insis_gen_v10/faces/login.jspx'
    end

    it  { 
      fill_in 'pt1:pt_s2:usrname::content', with: 'insis_aferrari'
      fill_in 'pt1:pt_s2:pswd::content', with: 'These1234'
      find_by_id('pt1:pt_s2:login').trigger('click') 
      sleep 5
      expect(page.find_by_id('pageTemplate:pt_psl3')).to have_link('Logout')
      find_by_id('pageTemplate:pt_ps1::i').trigger('click') 
      find_by_id('pageTemplate:treeMenu:1:treeMenuLink').click    
      sleep 5 
      find_by_id('pageTemplate:treeMenu:14:treeMenuLink').click     
      sleep 5
      find_by_id('pageTemplate:treeMenu:28:treeMenuLink').click
      sleep 5
      find_by_id('pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:qxmctb1').click
    
    
    
    
    
    }
    
  end
end
