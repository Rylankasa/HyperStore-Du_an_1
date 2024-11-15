    <?php
    class UserModel
    {
        public static function getAllUsersWithRoles()
        {
            global $MainModel;
            $sql = "SELECT u.*, r.role_name FROM users u 
                LEFT JOIN roles r ON u.role_id = r.role_id";
            try {
                $stmt = $MainModel->SUNNY->prepare($sql);
                $stmt->execute();
                return $stmt->fetchAll(PDO::FETCH_ASSOC);
            } catch (PDOException $e) {
                echo "Lỗi khi lấy danh sách người dùng: " . $e->getMessage();
                return false;
            }
        }
        public static function addUser($data)
        {
            global $MainModel;
            try {
                $stmt = $MainModel->SUNNY->prepare("INSERT INTO users (username, password, email, fullname, phone, address, avatar, role_id, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
                return $stmt->execute([
                    $data['username'],
                    $data['password'],
                    $data['email'],
                    $data['fullname'],
                    $data['phone'],
                    $data['address'],
                    $data['avatar'],
                    $data['role_id'],
                    $data['status']
                ]);
            } catch (PDOException $e) {
                echo "Lỗi khi thêm người dùng: " . $e->getMessage();
                return false;
            }
        }

        public static function getUserById($user_id)
        {
            global $MainModel;
            $sql = "SELECT u.*, r.role_name FROM users u 
                LEFT JOIN roles r ON u.role_id = r.role_id 
                WHERE u.user_id = ?";
            try {
                $stmt = $MainModel->SUNNY->prepare($sql);
                $stmt->execute([$user_id]);
                return $stmt->fetch(PDO::FETCH_ASSOC);
            } catch (PDOException $e) {
                echo "Lỗi khi lấy thông tin người dùng: " . $e->getMessage();
                return false;
            }
        }

        public static function updateUser($data)
        {
            global $MainModel;
            $sql = "UPDATE users SET username = ?, email = ?, address = ?, phone = ?, role_id = ?, status = ?";

            $params = [
                $data['username'],
                $data['email'],
                $data['address'],
                $data['phone'],
                $data['role_id'],
                $data['status']
            ];


            if (!empty($data['password'])) {
                $sql .= ", password = ?";
                $params[] = password_hash($data['password'], PASSWORD_BCRYPT);
            }


            if (!empty($data['avatar'])) {
                $sql .= ", avatar = ?";
                $params[] = $data['avatar'];
            }

            $sql .= " WHERE user_id = ?";
            $params[] = $data['user_id'];

            try {
                $stmt = $MainModel->SUNNY->prepare($sql);
                return $stmt->execute($params);
            } catch (PDOException $e) {
                echo "Lỗi khi cập nhật người dùng: " . $e->getMessage();
                return false;
            }
        }

        public static function deleteUser($user_id)
        {
            global $MainModel;
            $sql = "DELETE FROM users WHERE user_id = ?";
            try {
                $stmt = $MainModel->SUNNY->prepare($sql);
                return $stmt->execute([$user_id]);
            } catch (PDOException $e) {
                echo "Lỗi khi xóa người dùng: " . $e->getMessage();
                return false;
            }
        }

        public static function getRoles()
        {
            global $MainModel;
            $sql = "SELECT * FROM roles";
            try {
                $stmt = $MainModel->SUNNY->prepare($sql);
                $stmt->execute();
                return $stmt->fetchAll(PDO::FETCH_ASSOC);
            } catch (PDOException $e) {
                echo "Lỗi khi lấy danh sách vai trò: " . $e->getMessage();
                return false;
            }
        }
        public static function isUsernameExists($username)
        {
            global $MainModel;
            $stmt = $MainModel->SUNNY->prepare("SELECT COUNT(*) FROM users WHERE username = ?");
            $stmt->execute([$username]);
            return $stmt->fetchColumn() > 0;
        }


        public static function isEmailExists($email)
        {
            global $MainModel;
            $stmt = $MainModel->SUNNY->prepare("SELECT COUNT(*) FROM users WHERE email = ?");
            $stmt->execute([$email]);
            return $stmt->fetchColumn() > 0;
        }
    }
