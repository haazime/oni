module ComponentHelper

  def chunk_list_attributes(page)
    chunks = page.ordered_chunks.map { |c| chunk_attributes(page, c) }
    { chunks: chunks }
  end

  def chunk_attributes(page, chunk)
    chunk.attributes.merge(
      gpid: page.gpid,
      save_url: pages_url,
      destroy_url: destroy_chunk_url(gcid: chunk.gcid),
      save_delay: save_delay
    )
  end

  def save_delay
    @save_delay ||= Rails.env == 'test' ? 1 : 3000
  end

  # TODO: remove
  #def chunk_list_component_props(chunks)
  #  {
  #    active: chunks.max_by(&:updated_at).gcid,
  #    chunks: chunks.map { |c| chunk_component_props(c) }
  #  }
  #end

  #def chunk_component_props(chunk)
  #  chunk.attributes.merge(
  #    gpid: chunk.gpid,
  #    save_url: pages_url,
  #    save_delay: Rails.env == 'test' ? 1 : 2500,
  #    destroy_url: chunk.persisted? ? chunk_url(chunk) : nil
  #  )
  #end
end
