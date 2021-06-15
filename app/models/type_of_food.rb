class TypeOfFood < ActiveHash::Base
  self.data = [
    {id: 1, name: "--"},
    {id: 2, name: "主食"},
    {id: 3, name: "主菜"},
    {id: 4, name: "副菜"},
    {id: 5, name: "デザート"},
  ]

  include ActiveHash::Associations
  has_many :foods
end
