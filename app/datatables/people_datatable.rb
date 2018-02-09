class PeopleDatatable

  delegate :params, :link_to, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Person.count,
      iTotalDisplayRecords: people.total_entries,
      aaData: data
    }
  end

  private
    def data
      people.map do |p|
        [
          link_to(p.name, p),
          p.birth_date,
          p.phone,
          p.enable
        ]
      end
    end

    def people
      @people ||= fetch_people
    end

    def fetch_people
      people = Person.order("#{sort_column} #{sort_direction}")
      people = people.page(page).per_page(per_page)
      if params[:search][:value].present?
        people = people.where("name like :search", search: "%#{params[:search][:value]}%")
      end
      people
    end

    def page
      params[:start].to_i/per_page + 1
    end

    def per_page
      params[:length].to_i > 0 ? params[:length].to_i : 25
    end

    def sort_column
      columns = %w[ name birth_date ]
      columns[params[:order]['0'][:column].to_i]
    end

    def sort_direction
      params[:order]['0'][:dir] == 'desc' ? 'desc' : 'asc'
    end
end
