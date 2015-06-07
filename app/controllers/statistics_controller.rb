class StatisticsController < ApplicationController
  def basic
    number_of_tutorials_by_person
    number_of_tutorials_by_topic
    number_of_topics_by_category
    number_of_writers_by_topic
  end

  def number_of_tutorials_by_person
    user_list = User.all
    number_of_tutorials = {}
    user_list.each do |u|
      number_of_tutorials[u.user_name] = Tutorial.where(user_id: u.id).count
    end

    user_name_list = []; number_of_tutorials_list = []
    number_of_tutorials.sort{|(k1, v1), (k2, v2)| v2 <=> v1}[0..10].each do |k, v|
      user_name_list << k; number_of_tutorials_list << v
    end

    @graph1 = LazyHighCharts::HighChart.new('column') do |f|
      f.title(text: 'Number of tutorials')
      f.xAxis(categories: user_name_list)
      f.series(name: 'by writer', data: number_of_tutorials_list, color: 'blue')
      f.options[:chart][:defaultSeriesType] = "column"
      f.plot_options({:series=>{:stacking=>"normal"}})
    end
  end

  def number_of_tutorials_by_topic
    topic_list = Topic.all
    number_of_tutorials = {}
    topic_list.each do |t|
      number_of_tutorials[t.name] = Tutorial.where(topic_id: t.id).count
    end

    topic_name_list = []; number_of_tutorials_list = []
    number_of_tutorials.sort{|(k1, v1), (k2, v2)| v2 <=> v1}[0..10].each do |k, v|
      topic_name_list << k; number_of_tutorials_list << v
    end

    @graph2 = LazyHighCharts::HighChart.new('column') do |f|
      f.title(text: 'Number of tutorials')
      f.xAxis(categories: topic_name_list)
      f.series(name: 'by topic', data: number_of_tutorials_list, color: 'green')
      f.options[:chart][:defaultSeriesType] = "column"
      f.plot_options({:series=>{:stacking=>"normal"}})
    end
  end

  def number_of_topics_by_category
    category_list = Category.all
    number_of_topics = {}
    category_list.each do |c|
      number_of_topics[c.name] = Topic.where(category_id: c.id).count
    end

    category_name_list = []; number_of_topics_list = []
    number_of_topics.sort{|(k1, v1), (k2, v2)| v2 <=> v1}[0..10].each do |k, v|
      category_name_list << k; number_of_topics_list << v
    end

    @graph3 = LazyHighCharts::HighChart.new('column') do |f|
      f.title(text: 'Number of topics')
      f.xAxis(categories: category_name_list)
      f.series(name: 'by category', data: number_of_topics_list, color: 'orange')
      f.options[:chart][:defaultSeriesType] = "column"
      f.plot_options({:series=>{:stacking=>"normal"}})
    end
  end

  def number_of_writers_by_topic
    topic_list = Topic.all
    number_of_users = {}
    topic_list.each do |t|
      User.all.each do |u|
        u.tutorials.each do |tu|
          if tu.topic_id == t.id
            number_of_users[t.name] = 0 unless number_of_users[t.name]
            number_of_users[t.name] += 1
            break;
          end
        end
      end
    end

    topic_name_list = []; number_of_users_list = []
    number_of_users.sort{|(k1, v1), (k2, v2)| v2 <=> v1}[0..10].each do |k, v|
      topic_name_list << k; number_of_users_list << v
    end

    @graph4 = LazyHighCharts::HighChart.new('column') do |f|
      f.title(text: 'Number of writers')
      f.xAxis(categories: topic_name_list)
      f.series(name: 'by topic', data: number_of_users_list, color: 'purple')
      f.options[:chart][:defaultSeriesType] = "column"
      f.plot_options({:series=>{:stacking=>"normal"}})
    end
  end
end
