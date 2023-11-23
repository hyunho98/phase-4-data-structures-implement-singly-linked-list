require_relative './node'

class LinkedList
    attr_accessor :head

    def initialize
        @head = nil
    end

    def prepend(node)
        if head.nil?
            self.head = node
        else
            node.next_node = head
            self.head = node
        end
    end

    def append(node)
        if head.nil?
            self.head = node
        else
            last_node = head
            while last_node.next_node
                last_node = last_node.next_node
            end
            last_node.next_node = node
        end
    end

    def delete_head
        if head.nil?
            return
        end

        if head.next_node
            second_node = head.next_node
            self.head = second_node
        else
            self.head = nil
        end
    end

    def delete_tail
        if head.nil?
            return
        end

        
        if head.next_node
            second_last = head
            while second_last.next_node.next_node
                second_last = second_last.next_node
            end
            second_last.next_node = nil
        else
            self.head = nil
        end
    end

    def add_after(index, node)
        index_node = head

        index.times do
            if index_node.next_node
                index_node = index_node.next_node
            end
        end

        if index_node.next_node
            node.next_node = index_node.next_node
            index_node.next_node = node
        else
            index_node.next_node = node
        end
    end

    def search(value)
        node = head
        while node.next_node
            if node.data.equal?(value)
                return node
            end
            node = node.next_node
        end
    end
end
