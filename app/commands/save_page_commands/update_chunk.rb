module SavePageCommands
  UpdateChunk = Struct.new(:gcid, :content) do

    def run
      chunk = Chunk.find_by_gcid(gcid)
      chunk.update(content: content)
    end

    def render(controller)
      controller.render_for_update_chunk
    end
  end
end
