def is_balanced(root)
    queue = []
    queue << root
    until queue.empty?
        node = queue.shift

        if node.left && node.right
            if node.left.val > node.right.val
                return false
            
            end
        if node.left && node.right.nil?
            return false
        if node.left
            queue << node.left
        if node.right
            queue << node.right
        end
      end
    true
end
