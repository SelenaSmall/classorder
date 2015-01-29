require 'rspec'
require 'ostruct'
require './lib/order'

describe 'Order' do

  describe '#initialize' do
    it 'should have an items attribute which is an empty array' do

      instance = Order.new(1)
      expect(instance.items).to be_a Array
      expect(instance.items.length).to eq 0

    end

    it 'should have a table_number attribute which is set to the parameter' do
      instance = Order.new(17)

      expect(instance.table_number).to eq 17
    end
  end

  describe '#add_item' do
    it 'should add the item' do
      instance = Order.new(1)

      item = { :stuff => 2 }

      instance.add_item(item)
      expect(instance.items.length).to be 1
      expect(instance.items).to eq([ item ])
    end
  end

  describe '#find_order_total_and_gst' do

    it 'should find the total value of the order' do
      instance = Order.new(1)

      line_item_food = OpenStruct.new({
        :get_total_quantity_of_items => 7,
        :get_total_gst => 3,
      })  
      instance.add_item(line_item_food)

      line_item_food = OpenStruct.new({
        :get_total_quantity_of_items => 8,
        :get_total_gst => 3,
      }) 
      instance.add_item(line_item_food)

      total, gst = instance.find_order_total_and_gst

      expect(total).to be 15
      expect(gst).to be 6

    end

  end

  describe '#drinks' do

    it 'should return only drinks' do
      line_item_food = OpenStruct.new({
        :menu_item => OpenStruct.new({
          :item_course => :starter
        })
      })
      line_item_beer = OpenStruct.new({
        :menu_item => OpenStruct.new({
          :item_course => :beer
        })
      })
      line_item_spirits = OpenStruct.new({
        :menu_item => OpenStruct.new({
          :item_course => :spirits
        })
      })

      instance = Order.new(1)

      instance.add_item(line_item_food)
      instance.add_item(line_item_beer)
      instance.add_item(line_item_spirits)

      drinks = instance.drinks

      expect(drinks).to be_a Array
      expect(drinks.length).to be 2
      expect(drinks).to eq([ line_item_beer, line_item_spirits ])

    end
  end

  describe '#mains' do

    it 'should return only mains' do
      line_item_food = OpenStruct.new({
        :menu_item => OpenStruct.new({
          :item_course => :main
        })
      })
      line_item_beer = OpenStruct.new({
        :menu_item => OpenStruct.new({
          :item_course => :beer
        })
      })

      instance = Order.new(1)

      instance.add_item(line_item_food)
      instance.add_item(line_item_beer)

      mains = instance.mains

      expect(mains).to be_a Array
      expect(mains.length).to be 1
      expect(mains).to eq([ line_item_food ])

    end
  end
end

