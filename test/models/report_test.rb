require "test_helper"

class ReportTest < MiniTest::Test
  def test_adds_one_item
    report = Report.new
    report.add_item 1

    assert_equal report.empty?, false
  end

  def test_adds_up_in_quantity
    report = Report.new
    3.times { report.add_item 1 }

    assert_equal 1, report.items.length
    assert_equal 3, report.items.first.quantity
  end

  def test_retrieves_projects
    project = Project.create! name: "Tomato", price: 1

    report = Report.new
    report.add_item project.id

    assert_kind_of Project, report.items.first.project
  end


  def test_builds_from_hash
    report = Report.build_from_hash session_hash

    assert_equal 1, report.items.first.project_id
  end

  def test_serializes_to_hash
    report = Report.new
    report.add_item 1

    assert_equal report.serialize, session_hash["report"]
  end

  private

  def session_hash
    {
      "report" => {
        "items" => [
          { "project_id" => 1, "quantity" => 1 }
        ]
      }
    }
  end
end
